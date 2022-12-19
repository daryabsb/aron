import os
import qrcode

from relatorio.templates.opendocument import Template
import tempfile
import time

import win32api  # not included in requirements.txt
import win32ui
import win32con
import win32print



myprinter_name = "POSSTORE PS-7"
# get the name from your Printers folder

printer_properties=[]

def get_active_printer(index=2) -> str:
    all_printers = [printer[2] for printer in win32print.EnumPrinters(2)]
    print(all_printers[index])
    return all_printers[index]

def generate_qr_code(qr_input: str):
    """Generates a .PNG QR code."""
    with tempfile.NamedTemporaryFile(delete=False, suffix='.png') as tmpfile:
        qr = qrcode.make(qr_input)
        qr.save(tmpfile, qr.format, quality=100)
        time.sleep(1)
        return tmpfile.name


def save():
    pHandle = win32print.OpenPrinter(myprinter_name)
    properties = win32print.GetPrinter(pHandle, 2)
    pDevModeObj = properties["pDevMode"]
    printer_properties.append(pDevModeObj.FormName)
    printer_properties.append(pDevModeObj.PaperSize)
    printer_properties.append(pDevModeObj.Orientation)
    printer_properties.append(pDevModeObj.Color)
    printer_properties.append(pDevModeObj.Copies)
    printer_properties.append(pDevModeObj.DefaultSource)
    win32print.ClosePrinter(pHandle)

def apply():
    hprinter = win32print.OpenPrinter(myprinter_name)

    devmode = win32print.GetPrinter(hprinter, 2)["pDevMode"]
    devmode.FormName=printer_properties[0]
    devmode.PaperSize=printer_properties[1]
    devmode.Orientation=printer_properties[2]
    devmode.Color=printer_properties[3]
    devmode.Copies=printer_properties[4]
    devmode.DefaultSource=printer_properties[5]

    hdc = win32ui.CreateDC("WinPrint",myprinter_name,devmode)
    dc = win32ui.CreateDCFromHandle(hdc)

    dc.StartDoc('My Python Document')
    dc.StartPage()
    dc.EndPage()
    dc.EndDoc()
    del dc

def create_print_job(printername,description):
    # So you want to produce some output? On the surface it sounds pretty simple:

    # create a dc (Device Context) object (actually a PyCDC)
    dc = win32ui.CreateDC()

    # convert the dc into a "printer dc"

    # leave out the printername to get the default printer automatically
    dc.CreatePrinterDC(printername)

    # you need to set the map mode mainly so you know how
    # to scale your output.  I do everything in points, so setting 
    # the map mode as "twips" works for me.
    dc.SetMapMode(win32con.MM_TWIPS) # 1440 per inch

    # here's that scaling I mentioned:
    scale_factor = 20 # i.e. 20 twips to the point

    # start the document.  the description variable is a string
    # which will appear in the print queue to identify the job.
    dc.StartDoc(description)

    # to draw anything (other than text) you need a pen.
    # the variables are pen style, pen width and pen color.
    # pen = win32ui.CreatePen(0, int(scale_factor), 0L)
    pen = win32ui.CreatePen(0, int(scale_factor), 0)

    # SelectObject is used to apply a pen or font object to a dc.
    dc.SelectObject(pen)

    # how about a font?  Lucida Console 10 point.
    # I'm unsure how to tell if this failed.
    font = win32ui.CreateFont({
        "name": "Lucida Console",
        "height": int(scale_factor * 10),
        "weight": 400,
    })

    # again with the SelectObject call.
    dc.SelectObject(font)

    # okay, now let's print something.
    # TextOut takes x, y, and text values.
    # the map mode determines whether y increases in an
    # upward or downward direction; in MM_TWIPS mode, it
    # advances up, so negative numbers are required to 
    # go down the page.  If anyone knows why this is a
    # "good idea" please email me; as far as I'm concerned
    # it's garbage.
    dc.TextOut(scale_factor * 72,
        -1 * scale_factor * 72,
        "Testing...")

    # for completeness, I'll draw a line.
    # from x = 1", y = 1"
    dc.MoveTo((scale_factor * 72, scale_factor * -72))
    # to x = 6", y = 3"
    dc.LineTo((scale_factor * 6 * 72, scale_factor * 3 * -72))

    # must not forget to tell Windows we're done.
    dc.EndDoc()

def print_placard():
    inv = {}
    inv['my_text'] = 'example text'
    inv['another_text'] = 'hello world!'
    
    # QR codes
    inv['my_qr'] = (open(generate_qr_code("12345A"), 'rb'), 'image/png')

    template_path = os.path.dirname(os.path.abspath(__file__))
    # template_file = r'basic.odt'
    template_file = r'basic.odt'

    filepath = os.path.join(template_path, template_file)
    print(filepath)

    basic = Template(source='', filepath=filepath)

    with tempfile.NamedTemporaryFile(delete=False, suffix='.odt') as tmpfile:
        output = basic.generate(o=inv).render().getvalue()
        # print("output", output)
        tmpfile.write(output)  # /tmp in GNU/Linux,  %temp% in Windows 
        active_printer = get_active_printer(0)
        printer = win32print.OpenPrinter(active_printer)      
        time.sleep(2)
        # print(f'Printing: {tmpfile.name}')
        # win32api.ShellExecute(0, 'print', tmpfile.name, f'/d:"{win32print.GetDefaultPrinter()}"', '.', 0)
        win32api.ShellExecute(0, 'printto', tmpfile.name, f'/d:"{printer}"', '.', 0)
        win32print.ClosePrinter(printer)


if __name__ == "__main__":
    print_placard()
# create_print_job('POSSTORE PS-7','Anything...')



props = {
    'pServerName': None, 
    'pPrinterName': 'WF-C5710 Series(Network)', 
    'pShareName': '', 
    'pPortName': '192.168.1.6:WF-C5710 SERIES', 
    'pDriverName': 'EPSON WF-C5710 Series', 
    'pComment': '', 'pLocation': '', 
    'pDevMode': '<PyDEVMODEW object at 0x00000203A48C0B80>', 
    'pSepFile': '', 
    'pPrintProcessor': 'winprint', 
    'pDatatype': 'RAW', 
    'pParameters': '', 
    'pSecurityDescriptor': '<PySECURITY_DESCRIPTOR object at 0x00000203A48D6200>', 
    'Attributes': 2112, 
    'Priority': 1, 
    'DefaultPriority': 0, 
    'StartTime': 0, 
    'UntilTime': 0, 
    'Status': 0, 
    'cJobs': 0, 
    'AveragePPM': 0
    }