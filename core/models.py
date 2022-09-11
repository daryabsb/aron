from django.db import models
from django.contrib.auth.models import AbstractBaseUser
from django.contrib.auth.models import PermissionsMixin

from .managers import UserManager

from .modules import (
    # calculateAge,
    # save_pdf_pages_attachment,
    upload_image_file_path,
    # pdf_page_count
)

# Create your models here.

BIT_CHOICES = [
    ("0", 0),
    ("1", 1),
    ("null", None),
]


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
        ordering = ("-created",)

    objects = UserManager()

    USERNAME_FIELD = "email"


class Counter(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="country")
    name = models.CharField(max_length=30)
    value = models.SmallIntegerField()

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class Country(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="countries")
    name = models.CharField(max_length=100, unique=True)
    code = models.CharField(max_length=4)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class Currency(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="currencies"
    )
    name = models.CharField(max_length=100, unique=True)
    code = models.CharField(max_length=4)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.code}: {self.name}"


"""
COMPANY RELATED
"""


class Company(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="companies")
    name = models.CharField(max_length=100, unique=True)
    address = models.CharField(max_length=300, null=True, blank=True)
    postal_code = models.CharField(max_length=50, null=True, blank=True)
    city = models.CharField(max_length=50, null=True, blank=True)
    country = models.ForeignKey(
        "Country", default=1, on_delete=models.CASCADE,
        related_name="companies"
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
        return f"{self.name} - {self.country.name}"


"""
ALL ABOUT DOCUMENTS (INVOICES AND STUFF)
"""


class DocumentCategory(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="document_categories"
    )
    name = models.CharField(max_length=100, unique=True)
    language = models.CharField(max_length=4)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.language}: {self.name}"


class DocumentType(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="document_types"
    )
    name = models.CharField(max_length=100, unique=True)
    code = models.CharField(max_length=50)
    category = models.ForeignKey(
        "DocumentCategory",
        on_delete=models.SET_NULL,
        null=True,
        related_name="document_types",
    )
    warehouse = models.ForeignKey(
        "Warehouse", on_delete=models.SET_NULL, null=True, related_name="document_types"
    )
    stock_direction = models.SmallIntegerField(default=0)
    editor_type = models.SmallIntegerField(default=0)
    print_template = models.TextField(null=True, blank=True)
    price_type = models.SmallIntegerField(default=0)
    language = models.CharField(max_length=4)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.code} | {self.name}"


class Document(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="documents")
    number = models.CharField(max_length=30, unique=True)
    customer = models.ForeignKey(
        "Customer", on_delete=models.DO_NOTHING, null=True, related_name="documents"
    )
    order_number = models.CharField(max_length=30, unique=True)
    date = models.DateTimeField(auto_now_add=True)
    stock_date = models.DateTimeField(auto_now_add=True)
    total = models.FloatField(default=0)
    is_clocked_out = models.SmallIntegerField(default=0)
    document_type = models.ForeignKey(
        "DocumentType", on_delete=models.DO_NOTHING, related_name="documents"
    )
    warehouse = models.ForeignKey(
        "Warehouse", null=True, on_delete=models.DO_NOTHING, related_name="documents"
    )
    reference_document_number = models.CharField(max_length=100, unique=True)
    internal_note = models.TextField(null=True, blank=True)
    note = models.TextField(null=True, blank=True)
    due_date = models.DateTimeField(auto_now_add=True)
    discount = models.SmallIntegerField(default=0)
    discount_type = models.SmallIntegerField(default=0)
    paid_status = models.SmallIntegerField(default=0)
    discount_apply_rule = models.SmallIntegerField(default=0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.language}: {self.name}"


class DocumentItem(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="document_items"
    )
    document = models.ForeignKey(
        "Document", on_delete=models.CASCADE, null=True, related_name="document_items"
    )
    product = models.ForeignKey(
        "Product", on_delete=models.DO_NOTHING, related_name="document_items"
    )
    quantity = models.SmallIntegerField(default=1)
    expected_quantity = models.SmallIntegerField(default=1)
    price_before_tax = models.FloatField(default=0)
    price = models.FloatField(default=0)
    discount = models.FloatField(default=0)
    discount_type = models.FloatField(default=0)
    product_cost = models.FloatField(default=0)
    price_before_tax_after_descount = models.FloatField(default=0)
    price_after_descount = models.FloatField(default=0)
    total = models.FloatField(default=0)
    total_after_document_discount = models.FloatField(default=0)
    discount_apply_rule = models.SmallIntegerField(default=0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.product.name}: {self.quantity} | total= {self.total}"


class DocumentItemTax(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="document_item_taxes"
    )
    document_item = models.ForeignKey(
        "DocumentItem",
        on_delete=models.CASCADE,
        null=True,
        related_name="document_item_taxes",
    )
    tax = models.ForeignKey(
        "Tax", on_delete=models.DO_NOTHING, related_name="document_item_taxes"
    )
    amount = models.FloatField(default=0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"DocumentItem ID:{self.document_item.id}= Amount ({self.amount})"


class Migration(models.Model):
    version = models.CharField(max_length=100)
    description = models.TextField(null=True, blank=True)
    file_name = models.CharField(max_length=250)
    module = models.CharField(max_length=250)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Version:{self.version} | on: ({self.created})"


"""
PAYMENT TABLES
"""


class PaymentType(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="payment_types"
    )
    name = models.CharField(max_length=100)
    code = models.CharField(max_length=100, null=True, blank=True)
    is_customer_required = models.BooleanField(default=False)
    is_fiscal = models.BooleanField(default=True)
    is_slip_required = models.BooleanField(default=False)
    is_change_allowed = models.BooleanField(default=True)
    ordinal = models.BooleanField(default=False)
    is_enabled = models.BooleanField(default=True)
    is_quick_payment = models.BooleanField(default=True)
    open_cash_drawer = models.BooleanField(default=False)
    shortcut = models.CharField(max_length=30, null=True, blank=True)
    mark_as_paid = models.BooleanField(default=False)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.name} - {self.code}"


class Payment(models.Model):
    user = models.ForeignKey(
        "User",
        on_delete=models.CASCADE,
        related_name="payments"
    )
    document = models.ForeignKey(
        "Document",
        on_delete=models.CASCADE,
        null=True,
        related_name="payments",
    )
    payment_type = models.ForeignKey(
        "PaymentType", on_delete=models.DO_NOTHING, related_name="payments"
    )
    amount = models.FloatField(default=0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Document:{self.document}= Amount ({self.amount})"


class FiscalItem(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="fiscals")
    plu = models.IntegerField(null=True, blank=True)
    name = models.CharField(max_length=100)
    vat = models.CharField(max_length=50)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.name} - {self.plu}"


class FloorPlan(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="floor_plans"
    )
    name = models.CharField(max_length=100)
    color = models.CharField(max_length=50, default="Transparent")

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class FloorPlanTable(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="floor_plan_tables"
    )
    name = models.CharField(max_length=100)
    floor_plan = models.ForeignKey(
        "FloorPlan", on_delete=models.CASCADE, related_name="tables"
    )
    position_x = models.FloatField(default=0)
    position_y = models.FloatField(default=0)
    width = models.FloatField(default=0)
    height = models.FloatField(default=0)
    is_round = models.SmallIntegerField(default=0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.name} @ {self.floor_plan.name}"


'''
POS RELATED
'''


class PosOrder(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="orders")
    number = models.CharField(max_length=100, unique=True)
    discount = models.SmallIntegerField(default=0)
    discount_type = models.SmallIntegerField(default=0)
    total = models.FloatField(default=0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.language}: {self.name}"


class PosOrderItem(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="order_items"
    )
    order = models.ForeignKey(
        "PosOrder", on_delete=models.CASCADE, null=True, related_name="order_items"
    )
    product = models.ForeignKey(
        "Product", on_delete=models.DO_NOTHING, related_name="order_items"
    )
    quantity = models.SmallIntegerField(default=1)
    price = models.FloatField(default=0)
    is_locked = models.BooleanField(default=False)
    discount = models.FloatField(default=0)
    discount_type = models.FloatField(default=0)
    is_featured = models.BooleanField(default=False)
    # voide by = not comparable
    voide_by = models.SmallIntegerField(default=0)
    comment = models.TextField(null=True, blank=True)
    bundle = models.TextField(null=True, blank=True)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.product.name}: {self.quantity} | total= {self.total}"


'''
PRINTER TABLES
'''


class PosPrinterSelection(models.Model):
    key = models.CharField(max_length=30, unique=True)
    printer_name = models.CharField(max_length=100)
    is_enabled = models.BooleanField(default=False)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=["id", "key"], name="unique_printer_keys"
            )
        ]

    def __str__(self):
        return f'{self.printer_name}: {self.key}' + \
            f'| IsEnabled= {self.is_enabled}'


class PosPrinterSelectionSettings(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="pos_printer_settings"
    )
    pos_printer_selection = models.ForeignKey(
        "PosPrinterSelection", on_delete=models.CASCADE,
        null=True, related_name="settings"
    )
    paper_width = models.SmallIntegerField(default=32)
    header = models.CharField(max_length=100)
    footer = models.CharField(max_length=100)
    feed_lines = models.SmallIntegerField(default=0)
    cut_paper = models.SmallIntegerField(default=1)
    print_bitmap = models.SmallIntegerField(default=0)
    open_cash_drawer = models.SmallIntegerField(default=1)
    cash_drawer_command = models.CharField(max_length=100)
    header_alignment = models.SmallIntegerField(default=0)
    footer_alignment = models.SmallIntegerField(default=0)
    is_formatting_enabled = models.BooleanField(default=False)
    printer_type = models.SmallIntegerField(default=0)
    number_of_copies = models.SmallIntegerField(default=1)
    code_page = models.SmallIntegerField(default=-1)
    character_set = models.SmallIntegerField(default=-1)
    margin = models.SmallIntegerField(default=0)
    left_margin = models.FloatField(default=1)
    top_margin = models.FloatField(default=0)
    right_margin = models.FloatField(default=0)
    bottom_margin = models.FloatField(default=0)
    print_barcode = models.SmallIntegerField(default=1)
    font_name = models.CharField(max_length=100)
    font_size_percent = models.FloatField(default=100.0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name_plural = "PosPrinterSelectionSettings"

    def __str__(self):
        return f"Settings for: {self.pos_printer_selection.printer_name}"


"""
PRODUCT RELATED
"""


class ProductGroup(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="productGroups"
    )
    name = models.CharField(max_length=100)
    parent_group = models.ForeignKey(
        "self", null=True, blank=True, on_delete=models.SET_NULL
    )
    color = models.CharField(max_length=50, default="Transparent")
    image = models.ImageField(null=True, blank=True,
                              upload_to=upload_image_file_path)
    rank = models.SmallIntegerField(default=0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ('rank',)

    def __str__(self):
        return self.name


class Product(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="products")
    name = models.CharField(max_length=100)
    product_group = models.ForeignKey("ProductGroup", on_delete=models.CASCADE)
    code = models.CharField(max_length=100, null=True, blank=True)
    description = models.CharField(max_length=300, null=True, blank=True)
    plu = models.IntegerField(null=True, blank=True)
    measurement_unit = models.CharField(max_length=10, null=True, blank=True)
    price = models.FloatField(default=0)
    is_tax_inclusive_price = models.CharField(
        max_length=10, choices=BIT_CHOICES, default="0"
    )
    currency = models.ForeignKey(
        "Currency", on_delete=models.CASCADE, related_name="products"
    )
    is_price_change_allowed = models.CharField(
        max_length=10, choices=BIT_CHOICES, default="0"
    )
    is_service = models.CharField(
        max_length=10, choices=BIT_CHOICES, default="0")
    is_using_default_quantity = models.CharField(
        max_length=10, choices=BIT_CHOICES, default="1"
    )
    cost = models.FloatField(default=0, null=True, blank=True)
    margin = models.DecimalField(max_digits=18, decimal_places=3, default=0)
    image = models.ImageField(null=True, blank=True,
                              upload_to=upload_image_file_path)
    color = models.CharField(max_length=50, default="Transparent")
    is_enabled = models.CharField(
        max_length=10, choices=BIT_CHOICES, default="1")

    age_restriction = models.SmallIntegerField(null=True, blank=True)
    last_purchase_price = models.FloatField(default=0)
    rank = models.SmallIntegerField(default=0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.name} - {self.price} /{self.product_group}"


class Barcode(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="barcodes")
    product = models.ForeignKey(
        "Product", on_delete=models.CASCADE, related_name="barcodes"
    )
    value = models.CharField(max_length=250)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"({self.product.name}) - {self.value}"


class ProductComment(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="comments")
    product = models.ForeignKey(
        "Product", on_delete=models.CASCADE, related_name="comments"
    )
    value = models.CharField(max_length=300)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.product} - {self.created}"


class Warehouse(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="warehouses"
    )
    name = models.CharField(max_length=100)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class Stock(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="stocks")
    product = models.ForeignKey(
        "Product", on_delete=models.CASCADE, related_name="stocks"
    )
    warehouse = models.ForeignKey(
        "Warehouse", on_delete=models.CASCADE, related_name="stocks"
    )

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.product} @ {self.warehouse}"


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
        return f"{self.name} @ {self.rate}"


class ProductTax(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="productTaxes"
    )
    product = models.ForeignKey(
        "Product", on_delete=models.CASCADE, related_name="productTaxes"
    )
    tax = models.ForeignKey(
        "Tax", on_delete=models.CASCADE, related_name="productTaxes"
    )

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=["product", "tax"], name="unique_product_taxes"
            )
        ]

    def __str__(self):
        return f"{self.product.name} @ {self.tax.name}"


"""
CUSTOMER RELATED
"""


class Customer(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="customers")
    code = models.CharField(max_length=30, null=True, blank=True)
    name = models.CharField(max_length=100, unique=True)
    address = models.CharField(max_length=300, null=True, blank=True)
    postal_code = models.CharField(max_length=50, null=True, blank=True)
    city = models.CharField(max_length=50, null=True, blank=True)
    country = models.ForeignKey(
        "Country", default=1, on_delete=models.CASCADE, related_name="customers"
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
        return f"{self.name} @ {self.city}"


class CustomerDiscount(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="customer_discounts"
    )
    customer = models.ForeignKey(
        "Customer", on_delete=models.CASCADE, related_name="discounts"
    )
    type = models.SmallIntegerField(default=0)
    uid = models.SmallIntegerField(default=0)
    value = models.FloatField(default=0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=["customer", "type", "uid"], name="unique_customer_discounts"
            )
        ]

    def __str__(self):
        return f"{self.customer.name} - {self.type} | {self.uid}"


class LoyaltyCard(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="customer_loyalty_cards"
    )
    customer = models.ForeignKey(
        "Customer", on_delete=models.CASCADE, related_name="customer_loyalty_cards"
    )
    number = models.CharField(max_length=100)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    # class Meta:
    #     indexes = [models.Index(fields=['customer']),]

    def __str__(self):
        return f"{self.customer.name} - {self.number}"
