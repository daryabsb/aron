from django.db import models

class Product(models.Model):
    
    # AUTO FIELDS
    user = models.ForeignKey("User", on_delete=models.CASCADE, related_name="products")
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    
    # ESSENTIAL - TAB01
    name = models.CharField(max_length=100)
    product_group = models.ForeignKey(
        "ProductGroup", on_delete=models.CASCADE, related_name="products"
    )
    code = models.CharField(max_length=100, null=True, blank=True)
    description = models.CharField(max_length=300, null=True, blank=True)
    measurement_unit = models.CharField(max_length=10, null=True, blank=True)
    plu = models.IntegerField(null=True, blank=True)
    rank = models.SmallIntegerField(default=0)

    
    # SPECIFICATIONS
    margin = models.DecimalField(max_digits=18, decimal_places=3, default=0)
    color = models.CharField(max_length=50, default="Transparent")

    # PRICES AND MONEY RELATED
    cost = models.FloatField(default=0, null=True, blank=True)
    last_purchase_price = models.FloatField(default=0)
    price = models.FloatField(default=0)
    currency = models.ForeignKey(
        "Currency", on_delete=models.CASCADE, related_name="products"
    )

    
    
    # OPTIONS
    is_enabled = models.BooleanField(default=True)
    is_tax_inclusive_price = models.BooleanField(default=False)
    is_price_change_allowed = models.BooleanField(default=False)
    is_service = models.BooleanField(default=False)
    is_using_default_quantity = models.BooleanField(default=True)
    age_restriction = models.SmallIntegerField(null=True, blank=True)
    
    
    # PHOTO
    image = models.ImageField(null=True, blank=True, upload_to=upload_image_file_path)


    def __str__(self):
        return f"{self.name} - {self.price} /{self.product_group}"
