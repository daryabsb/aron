import os
import qrcode

from relatorio.templates.opendocument import Template
import tempfile
import time
import win32api  # not included in requirements.txt
import win32print

def get_active_printer(index=2) -> str:
    all_printers = [printer[2] for printer in win32print.EnumPrinters(2)]
    print(all_printers[index])
    return all_printers[index]


def generate_qr(qr_input: str):
    qr_name = '' 
    with tempfile.NamedTemporaryFile(delete=False, suffix='.png') as tmpfile:
        qr = qrcode.QRCode(
            version=1,
            error_correction=qrcode.constants.ERROR_CORRECT_L,
            box_size=10,
            border=4,
        )
        qr.add_data(qr_input)
        qr.make(fit=True)
        img = qr.make_image(fill_color="black", back_color="white")        
        img = img.convert('RGB')

        pixels = img.load()
        pixels[0, 0] = (255, 0, 0)

        img.save(tmpfile.name, dpi=(96, 96))

        qr_name = tmpfile.name
    return qr_name

def main():
    inv = {}
    inv['shipmentnumber'] = '6'
    inv['units'] = '3'
    inv['model'] = 'MyModel'
    inv['systemnumber'] = '4'
    inv['productline'] = 'TestLine'
    inv['page'] = '1'
    inv['pagetotal'] = '99'
    inv['ordernumber'] = '9341'
    inv['my_qr'] = ''
    inv['ordernumberqr'] = (open(generate_qr(inv['ordernumber']), 'rb'), 'image/png')

    current_directory = os.getcwd()
    file_path = os.path.join(current_directory, 'prints\\basic.odt')
    print("FILE PATH", file_path)
    basic = Template(source='', filepath=file_path)

    with open('placard.odt', 'wb') as f:
        f.write(basic.generate(o=inv).render().getvalue())

    time.sleep(2)
    filename = 'placard.odt'
    print(f'Printing: {filename}')
    win32api.ShellExecute(0, 'print', filename, f'/d:"{win32print.GetDefaultPrinter()}"', '.', 0)

if __name__ == '__main__':
    main()


# if __name__ == "__main__":
#     print_placard()