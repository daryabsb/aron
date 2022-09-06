from re import T
from unicodedata import name
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.contrib.auth.models import PermissionsMixin


from .modules import (
    calculateAge, 
    # save_pdf_pages_attachment,
    profile_image_file_path, 
    # pdf_page_count
)
# Create your models here.


class UserManager(BaseUserManager):

    def create_user(self, email, password=None, **extra_fields):
        # Creates and save a new user
        if not email:
            raise ValueError('Users must have an email address!')

        user = self.model(email=self.normalize_email(email), **extra_fields)
        user.set_password(password)
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
                              upload_to=profile_image_file_path)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ('-created',)

    objects = UserManager()

    USERNAME_FIELD = 'email'

class ProductGroup(models.Model):
    name = models.CharField(max_length=100)
    parent_group = models.ForeignKey("self", null=True, blank=True, on_delete=models.SET_NULL)
    color = models.CharField(max_length=50, default='Transparent')
    image = models.ImageField(null=True, blank=True,
                              upload_to=profile_image_file_path)
    rank = models.SmallIntegerField(default=0)

    def __str__(self):
        return self.name

'''
[Id] INT IDENTITY ( 1, 1 )  NOT NULL, 
	[Name] NVARCHAR( 100 ) NOT NULL, 
	[ParentGroupId] INT NULL, 
	[Color] VARCHAR( 50 ) DEFAULT 'Transparent' NOT NULL, 
	[Image] IMAGE NULL, 
	[Rank] INT DEFAULT '((0))' NOT NULL,
	PRIMARY KEY ( [Id] ) )
'''
    

class Product(models.Model):
    name = models.CharField(max_length=100)
    product_group = models.ForeignKey('ProductGroup', on_delete=models.CASCADE)
    code = models.CharField(max_length=100, null=True,blank=True)
    description = models.CharField(max_length=300, null=True,blank=True)
    plu = models.IntegerField(null=True,blank=True)
    measurement_unit = models.CharField(max_length=10, null=True,blank=True)

    def __str__(self):
        return self.name

'''
    [Name] NVARCHAR( 100 ) NOT NULL, 
	[ProductGroupId] INT NULL, 
	[Code] VARCHAR( 100 ) NULL, 
	[Description] NVARCHAR( 300 ) NULL, 
	[PLU] INT NULL, 
	[MeasurementUnit] NVARCHAR( 10 ) NULL, 
	[Price] FLOAT DEFAULT '((0))' NOT NULL, 
	[IsTaxInclusivePrice] BIT DEFAULT '((1))' NOT NULL, 
	[IsPriceChangeAllowed] BIT DEFAULT '((0))' NOT NULL, 
	[IsService] BIT DEFAULT '((0))' NOT NULL, 
	[IsUsingDefaultQuantity] BIT DEFAULT '((1))' NOT NULL, 
	[Cost] FLOAT DEFAULT '((0))' NOT NULL, 
	[Margin] DECIMAL( 18, 4 ) DEFAULT '((0))' NOT NULL, 
	[Image] IMAGE NULL, 
	[Color] VARCHAR( 50 ) DEFAULT 'Transparent' NOT NULL, 
	[IsEnabled] BIT DEFAULT '((1))' NOT NULL, 
	[DateCreated] DATETIME NOT NULL, 
	[DateUpdated] DATETIME NOT NULL, 
	[AgeRestriction] INT NULL, 
	[LastPurchasePrice] FLOAT DEFAULT '((0))' NOT NULL, 
	[Rank] INT DEFAULT '((0))' NOT NULL,
'''