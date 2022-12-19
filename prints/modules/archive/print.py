import os
import qrcode

from relatorio.templates.opendocument import Template
import tempfile
import time
import win32api  # not included in requirements.txt
import win32print
import win32ui

from ctypes import *

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
    # win32ui.CreatePopupMenu()
    # mgm = open(r"mgm.dll")
    # print(type(mgm))
    # ctypes.WinDLL ("c:\\PComm\\ehlapi32.dll")
    # win32ui.CreateDialog(31,'mgm.dll')