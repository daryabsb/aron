from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.contrib.auth.models import PermissionsMixin


from .modules import (
    # calculateAge,
    # save_pdf_pages_attachment,
    upload_image_file_path,
    # pdf_page_count
)
# Create your models here.

BIT_CHOICES = [
    ('0', 0),
    ('1', 1),
    ('null', None),
]


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
    name = models.CharField(max_length=255, null=True, blank=True)
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


class Counter(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='country')
    name = models.CharField(max_length=30)
    value = models.SmallIntegerField()

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class Country(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='countries')
    name = models.CharField(max_length=100, unique=True)
    code = models.CharField(max_length=4)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class Currency(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='currencies')
    name = models.CharField(max_length=100, unique=True)
    code = models.CharField(max_length=4)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.code}: {self.name}'


'''
COMPANY RELATED
'''


class Company(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='companies')
    name = models.CharField(max_length=100, unique=True)
    address = models.CharField(max_length=300, null=True, blank=True)
    postal_code = models.CharField(max_length=50, null=True, blank=True)
    city = models.CharField(max_length=50, null=True, blank=True)
    country = models.ForeignKey(
        'Country', default=1, on_delete=models.CASCADE,
        related_name='companies'
    )
    tax_number = models.CharField(max_length=100, null=True, blank=True)
    email = models.EmailField(max_length=255, unique=True)
    phone = models.CharField(max_length=100, null=True, blank=True)
    logo = models.ImageField(null=True, blank=True,
                             upload_to=upload_image_file_path)
    bank_account_number = models.CharField(
        max_length=300, null=True, blank=True)
    bank_details = models.CharField(max_length=300, null=True, blank=True)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.name} - {self.country.name}'


class FiscalItem(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='fiscals')
    plu = models.IntegerField(null=True, blank=True)
    name = models.CharField(max_length=100)
    vat = models.CharField(max_length=50)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.name} - {self.plu}'


class FloorPlan(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='floor_plans')
    name = models.CharField(max_length=100)
    color = models.CharField(max_length=50, default='Transparent')

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class FloorPlanTable(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='floor_plan_tables')
    name = models.CharField(max_length=100)
    floor_plan = models.ForeignKey(
        'FloorPlan', on_delete=models.CASCADE, related_name='tables')
    position_x = models.FloatField(default=0)
    position_y = models.FloatField(default=0)
    width = models.FloatField(default=0)
    height = models.FloatField(default=0)
    is_round = models.SmallIntegerField(default=0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.name} @ {self.floor_plan.name}'


'''
PRODUCT RELATED
'''


class ProductGroup(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='productGroups')
    name = models.CharField(max_length=100)
    parent_group = models.ForeignKey(
        "self", null=True, blank=True, on_delete=models.SET_NULL)
    color = models.CharField(max_length=50, default='Transparent')
    image = models.ImageField(null=True, blank=True,
                              upload_to=upload_image_file_path)
    rank = models.SmallIntegerField(default=0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class Product(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='products')
    name = models.CharField(max_length=100)
    product_group = models.ForeignKey('ProductGroup', on_delete=models.CASCADE)
    code = models.CharField(max_length=100, null=True, blank=True)
    description = models.CharField(max_length=300, null=True, blank=True)
    plu = models.IntegerField(null=True, blank=True)
    measurement_unit = models.CharField(max_length=10, null=True, blank=True)
    price = models.FloatField(default=0)
    is_tax_inclusive_price = models.CharField(
        max_length=10, choices=BIT_CHOICES, default="0")
    currency = models.ForeignKey(
        'Currency', on_delete=models.CASCADE, related_name='products')
    is_price_change_allowed = models.CharField(
        max_length=10, choices=BIT_CHOICES, default="0")
    is_service = models.CharField(
        max_length=10, choices=BIT_CHOICES, default="0")
    is_using_default_quantity = models.CharField(
        max_length=10, choices=BIT_CHOICES, default="1")
    cost = models.FloatField(default=0, null=True, blank=True)
    margin = models.DecimalField(max_digits=18, decimal_places=3, default=0)
    image = models.ImageField(null=True, blank=True,
                              upload_to=upload_image_file_path)
    color = models.CharField(max_length=50, default='Transparent')
    is_enabled = models.CharField(
        max_length=10, choices=BIT_CHOICES, default="1")

    age_restriction = models.SmallIntegerField(null=True, blank=True)
    last_purchase_price = models.FloatField(default=0)
    rank = models.SmallIntegerField(default=0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.name} - {self.price} /{self.product_group}'


class Barcode(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='barcodes')
    product = models.ForeignKey(
        'Product', on_delete=models.CASCADE, related_name='barcodes')
    value = models.CharField(max_length=250)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'({self.product.name}) - {self.value}'


class ProductComment(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='comments')
    product = models.ForeignKey(
        'Product', on_delete=models.CASCADE, related_name='comments')
    value = models.CharField(max_length=300)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.product} - {self.created}'


class Warehouse(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='warehouses')
    name = models.CharField(max_length=100)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class Stock(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='stocks')
    product = models.ForeignKey(
        'Product', on_delete=models.CASCADE, related_name='stocks')
    warehouse = models.ForeignKey(
        'Warehouse', on_delete=models.CASCADE, related_name='stocks')

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.product} @ {self.warehouse}'


class Tax(models.Model):
    name = models.CharField(max_length=30)
    rate = models.DecimalField(max_digits=18, decimal_places=4, default=0)
    code = models.CharField(max_length=10, null=True, blank=True)
    is_fixed = models.CharField(
        max_length=10, choices=BIT_CHOICES, default="0")
    is_tax_on_total = models.CharField(
        max_length=10, choices=BIT_CHOICES, default="0")
    is_enabled = models.CharField(
        max_length=10, choices=BIT_CHOICES, default="0")
    amount = models.FloatField(default=0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.name} @ {self.rate}'


class ProductTax(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='productTaxes')
    product = models.ForeignKey(
        'Product', on_delete=models.CASCADE, related_name='productTaxes')
    tax = models.ForeignKey(
        'Tax', on_delete=models.CASCADE, related_name='productTaxes')

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=['product', 'tax'], name='unique_product_taxes')
        ]

    def __str__(self):
        return f'{self.product.name} @ {self.tax.name}'


'''
CUSTOMER RELATED
'''


class Customer(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='customers')
    code = models.CharField(max_length=30, null=True, blank=True)
    name = models.CharField(max_length=100, unique=True)
    address = models.CharField(max_length=300, null=True, blank=True)
    postal_code = models.CharField(max_length=50, null=True, blank=True)
    city = models.CharField(max_length=50, null=True, blank=True)
    country = models.ForeignKey(
        'Country', default=1, on_delete=models.CASCADE,
        related_name='customers'
    )
    tax_number = models.CharField(max_length=100, null=True, blank=True)
    email = models.EmailField(max_length=255, unique=True)
    phone = models.CharField(max_length=100, null=True, blank=True)
    is_enabled = models.CharField(
        max_length=10, choices=BIT_CHOICES, default="1")
    is_customer = models.CharField(
        max_length=10, choices=BIT_CHOICES, default="1")
    is_supplier = models.CharField(
        max_length=10, choices=BIT_CHOICES, default="1")
    due_date_period = models.SmallIntegerField(default=0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.name} @ {self.city}'


class CustomerDiscount(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='customer_discounts')
    customer = models.ForeignKey(
        'Customer', on_delete=models.CASCADE, related_name='discounts')
    type = models.SmallIntegerField(default=0)
    uid = models.SmallIntegerField(default=0)
    value = models.FloatField(default=0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=['customer', 'type', 'uid'],
                name='unique_customer_discounts'
            )
        ]

    def __str__(self):
        return f'{self.customer.name} - {self.type} | {self.uid}'


class LoyaltyCard(models.Model):
    user = models.ForeignKey(
        'User', on_delete=models.CASCADE, related_name='customer_loyalty_cards')
    customer = models.ForeignKey(
        'Customer', on_delete=models.CASCADE, related_name='customer_loyalty_cards')
    number = models.CharField(max_length=100)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    # class Meta:
    #     indexes = [models.Index(fields=['customer']),]

    def __str__(self):
        return f'{self.customer.name} - {self.number}'
