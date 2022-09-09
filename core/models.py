from re import T
from unicodedata import name
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.contrib.auth.models import PermissionsMixin


from .modules import (
    calculateAge,
    # save_pdf_pages_attachment,
    upload_image_file_path,
    # pdf_page_count
)
# Create your models here.


class UserManager(BaseUserManager):

    def create_user(self, email, password=None, name=None, **extra_fields):
        # Creates and save a new user
        if not email:
            raise ValueError('Users must have an email address!')

        user = self.model(email=self.normalize_email(email), **extra_fields)
        user.set_password(password)
        user.name = name
        user.save(using=self._db)

        return user

    def create_superuser(self, email, password):
        # Creates and save a new superuser
        user = self.create_user(email, password)
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user


class User(PermissionsMixin, AbstractBaseUser):
    # Custom user model supports email instead of username
    email = models.EmailField(max_length=255, unique=True)
    name = models.CharField(max_length=255)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    image = models.ImageField(null=True, blank=True,
                              upload_to=upload_image_file_path)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ('-created',)

    objects = UserManager()

    USERNAME_FIELD = 'email'


class ProductGroup(models.Model):
    user = models.ForeignKey('User', on_delete=models.CASCADE, related_name='productGroups')
    name = models.CharField(max_length=100)
    parent_group = models.ForeignKey(
        "self", null=True, blank=True, on_delete=models.SET_NULL)
    color = models.CharField(max_length=50, default='Transparent')
    image = models.ImageField(null=True, blank=True,
                              upload_to=upload_image_file_path)
    rank = models.SmallIntegerField(default=0)

    def __str__(self):
        return self.name


class Product(models.Model):

    BIT_CHOICES = [
        ('0', 0),
        ('1', 1),
        ('null', None),
]
    YEAR_IN_SCHOOL_CHOICES = [
    ('0', 0),
    ('1', 'Sophomore'),
    ('null', 'Junior'),
    ('SR', 'Senior'),
    ('GR', 'Graduate'),
]

    user = models.ForeignKey('User', on_delete=models.CASCADE, related_name='products')
    name = models.CharField(max_length=100)
    product_group = models.ForeignKey('ProductGroup', on_delete=models.CASCADE)
    code = models.CharField(max_length=100, null=True, blank=True)
    description = models.CharField(max_length=300, null=True, blank=True)
    plu = models.IntegerField(null=True, blank=True)
    measurement_unit = models.CharField(max_length=10, null=True, blank=True)
    price = models.FloatField(default=0)
    is_tax_inclusive_price = models.CharField(max_length=10, choices=BIT_CHOICES, default="0")
    is_price_change_allowed = models.CharField(max_length=10, choices=BIT_CHOICES, default="0")
    is_service = models.CharField(max_length=10, choices=BIT_CHOICES, default="0")
    is_using_default_quantity = models.CharField(max_length=10, choices=BIT_CHOICES, default="1")
    cost = models.FloatField(default=0,null=True,blank=True)
    margin = models.DecimalField(max_digits=18,decimal_places=3,default=0)
    image = models.ImageField(null=True, blank=True,
                              upload_to=upload_image_file_path)
    color = models.CharField(max_length=50, default='Transparent')
    is_enabled = models.CharField(max_length=10, choices=BIT_CHOICES, default="1")

    age_restriction = models.SmallIntegerField(null=True,blank=True)
    last_purchase_price = models.FloatField(default=0)
    rank = models.SmallIntegerField(default=0)


    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)


    def __str__(self):
        return f'{self.name} - {self.price} /{self.product_group}'


class Barcode(models.Model):
    user = models.ForeignKey('User', on_delete=models.CASCADE, related_name='barcodes')
    product = models.ForeignKey('Product', on_delete=models.CASCADE, related_name='barcodes')
    value = models.CharField(max_length=250)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'({self.product.name}) - {self.value}'


class ProductComment(models.Model):
    user = models.ForeignKey('User', on_delete=models.CASCADE, related_name='comments')
    product = models.ForeignKey('Product', on_delete=models.CASCADE, related_name='comments')
    value = models.CharField(max_length=300)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return f'{self.product} - {self.created}'

class Warehouse(models.Model):
    user = models.ForeignKey('User', on_delete=models.CASCADE, related_name='warehouses')
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name


'''
CREATE TABLE [dbo].[Warehouse] ( 
	[Id] INT IDENTITY ( 1, 1 )  NOT NULL, 
	[Name] NVARCHAR( 100 ) NOT NULL,
	PRIMARY KEY ( [Id] ) )
'''

