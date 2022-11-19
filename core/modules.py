from datetime import date
import uuid
import os
# from PyPDF2 import PdfFileReader


def calculateAge(birthDate):
    today = date.today()
    age = today.year - birthDate.year - (
        (today.month, today.day) < (birthDate.month, birthDate.day)
    )

    return age

# def save_pdf_pages_attachment(sender, instance, created, **kwargs):

#     if created:
#         instance.save()


def profile_image_file_path(instance, filename):
    # Generate file path for new recipe image
    ext = filename.split('.')[-1]
    filename = f'{uuid.uuid4()}.{ext}'

    return os.path.join('uploads/', filename)


def upload_image_file_path(instance, filename):
    # Generate file path for new recipe image
    model = instance._meta.model.__name__.lower()
    ext = filename.split('.')[-1]
    filename = f'{uuid.uuid4()}.{ext}'

    return os.path.join(f'uploads/{model}/', filename)


def upload_file_file_path(instance, filename):
    # Generate file path for new recipe image
    ext = filename.split('.')[-1]
    filename = f'{uuid.uuid4()}.{ext}'

    return os.path.join('uploads/files/', filename)


def rate(rate):
    return int(rate) / 100

# def pdf_page_count(link):
#     # Load the pdf to the PdfFileReader object with default settings
#     with open(link, "rb") as pdf_file:
#         pdf_reader = PdfFileReader(pdf_file)
#         num = pdf_reader.numPages
#         print(
#             f"The total number of pages in the pdf document is {pdf_reader.numPages}")
#     return num
