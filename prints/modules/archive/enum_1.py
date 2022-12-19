import win32api  # not included in requirements.txt
import win32print
import prints.print

all_printers = [printer[2] for printer in win32print.EnumPrinters(2)]
# print(win32print.EnumPrinters(3))
# print(all_printers[2])

if __name__ == "__main__":
    # print_placard()
    prints.print.get_active_printer(0)