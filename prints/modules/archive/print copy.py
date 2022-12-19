import os
import qrcode

from relatorio.templates.opendocument import Template
import tempfile
import time
import win32api  # not included in requirements.txt
import win32print


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
    template_file = r'basic.odt'

    filepath = os.path.join(template_path, template_file)
    print(filepath)

    basic = Template(source='', filepath=filepath)

    with tempfile.NamedTemporaryFile(delete=False, suffix='.odt') as tmpfile:
        output = basic.generate(o=inv).render().getvalue()
        print("output", output)
        tmpfile.write(output)  # /tmp in GNU/Linux,  %temp% in Windows        
        time.sleep(2)
        print(f'Printing: {tmpfile.name}')
        win32api.ShellExecute(0, 'print', tmpfile.name, f'/d:"{win32print.GetDefaultPrinter()}"', '.', 0)

if __name__ == "__main__":
    print_placard()