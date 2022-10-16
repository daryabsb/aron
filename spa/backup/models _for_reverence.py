class Product(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="products")
    name = models.CharField(max_length=100)
    product_group = models.ForeignKey(
        "ProductGroup", on_delete=models.CASCADE, related_name="products"
    )
    code = models.CharField(max_length=100, null=True, blank=True)
    description = models.CharField(max_length=300, null=True, blank=True)
    plu = models.IntegerField(null=True, blank=True)
    measurement_unit = models.CharField(max_length=10, null=True, blank=True)

    price = models.FloatField(default=0)
    
    is_using_default_quantity = models.BooleanField(default=True)
    is_tax_inclusive_price = models.BooleanField(default=False)
    is_price_change_allowed = models.BooleanField(default=False)
    is_service = models.BooleanField(default=False)
    currency = models.ForeignKey(
        "Currency", on_delete=models.CASCADE, related_name="products"
    )
    cost = models.FloatField(default=0, null=True, blank=True)
    margin = models.DecimalField(max_digits=18, decimal_places=3, default=0)
    image = models.ImageField(null=True, blank=True,
                              upload_to=upload_image_file_path)
    color = models.CharField(max_length=50, default="Transparent")
    is_enabled = models.BooleanField(default=True)
    age_restriction = models.SmallIntegerField(null=True, blank=True)
    last_purchase_price = models.FloatField(default=0)
    rank = models.SmallIntegerField(default=0)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.name} - {self.price} /{self.product_group}"


class PosOrder(models.Model):
    user = models.ForeignKey(
        "User", on_delete=models.CASCADE, related_name="orders")
    number = models.CharField(max_length=100, unique=True)
    discount = models.SmallIntegerField(default=0)
    discount_type = models.SmallIntegerField(default=0)
    total = models.FloatField(default=0)


class PosOrderItem(models.Model):
    
    order = models.ForeignKey(
        "PosOrder", on_delete=models.CASCADE, null=True, related_name="items"
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
        return f"Order#:{self.order.id}: {self.quantity}"

