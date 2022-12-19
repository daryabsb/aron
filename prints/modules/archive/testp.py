# from escpos.connections import getUSBPrinter

# printer = getUSBPrinter()(idVendor=0x1504,
#                           idProduct=0x0006
#                           inputEndPoint=0x82,
#                           outputEndPoint=0x01) # Create the printer object with the connection params

# # Print a barcode
# printer.barcode(text='Shantanu', textPosition='below', font='b', height=100, width=2, system='CODE93')
# printer.lf()

import os, sys
import tempfile
import win32print

import qrcode
img = qrcode.make('Some data here')
type(img)  # qrcode.image.pil.PilImage
img.save("some_file.png")
# printer_name = win32print.GetDefaultPrinter ()
printer_name = "POSSTORE PS-7"
#
# raw_data could equally be raw PCL/PS read from
#  some print-to-file operation
#

filename = tempfile.mktemp (".txt")

with open(filename, 'w') as f:
    f.write("This is from filename")

with open(filename, 'r') as f:
    print("FU",''.join(f.readlines()))
    raw_data = f.readlines()

# if sys.version_info >= (3,):
# print(type(bytes(raw_data,"utf-8")))
# raw_data = raw_data, 'utf-8')

bytes_encoded = ''.join(raw_data).encode(encoding='utf-8')


hPrinter = win32print.OpenPrinter (printer_name, None)

print(dir(hPrinter))

try:
  hJob = win32print.StartDocPrinter (hPrinter, 1, ("bytes_encoded", filename, "RAW"))
  try:
    print("passed-01")
    win32print.StartPagePrinter (hPrinter)
    print("passed-02")
    win32print.WritePrinter (hPrinter, "bytes_encoded".encode(encoding='utf-8'))
    print("passed-03")
    win32print.EndPagePrinter (hPrinter)
    print("passed-04")
  finally:
    win32print.EndDocPrinter (hPrinter)
finally:
  win32print.ClosePrinter (hPrinter)
