from rest_framework import serializers
from core.models import (Barcode, Product, ProductGroup, Stock,
                         Warehouse, ProductTax, Tax,)
from taxes.serializers import ProductTaxSerializer
from core.modules import rate
# from django.shortcuts import get_object_or_404


class ProductSerializer(serializers.ModelSerializer):

    stock_quantity = serializers.SerializerMethodField()
    tax = serializers.SerializerMethodField()
    productTaxes = ProductTaxSerializer(many=True, read_only=True)

    class Meta:
        model = Product
        fields = ("id", "name", "code", "description", "age_restriction",
                  "price", "is_tax_inclusive_price", "is_price_change_allowed",
                  "is_service", "is_using_default_quantity", "cost", "margin",
                  "image", "color", "is_enabled", "measurement_unit", "plu",
                  "last_purchase_price", "rank", "user", "parent_group",
                  "is_product", "currency", "stock_quantity", "tax",
                  "productTaxes", "created", "updated")
        read_only_fields = ("id",)

    def get_stock_quantity(self, obj):
        if Stock.objects.filter(product=obj.id).exists():
            stock = Stock.objects.get(product=obj.id)
            # print(stock)
        # if stock:
            return stock.quantity
        return 0

    def get_tax(self, obj):
        if ProductTax.objects.filter(product=obj).exists():
            product_tax = ProductTax.objects.filter(product=obj)
            tv, tm, total, total_rate = 0, 0, 0, 0
            for t in product_tax:
                if t.tax.is_tax_on_total:
                    total_rate += rate(float(t.tax.rate)) + \
                        t.tax.amount / float(obj.price)
                    total += (rate(float(t.tax.rate)) *
                              float(obj.price)) + t.tax.amount
                else:
                    tv += t.tax.rate
                    tm += t.tax.amount
            return {'rate': tv, 'amount': tm, 'total_rate': total_rate, 'total': total}
        return {'rate': 0, 'amount': 0, 'total': 0}


class BarcodeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Barcode
        fields = ("id", "product", "value", "created", "updated")
        read_only_Fields = "id"


class NestedProductGroup(serializers.ModelSerializer):
    class Meta:
        model = ProductGroup
        fields = (
            "id",
            "name",
        )
        # read_only_fields = ("id",)


class WarehouseSerializer(serializers.ModelSerializer):

    class Meta:
        model = Warehouse
        fields = ('id', 'name', )
        read_only_fields = ('id',)


class StockSerializer(serializers.ModelSerializer):

    class Meta:
        model = Stock
        fields = ('id', 'product', 'warehouse', 'quantity',
                  'created', 'updated',)
        read_only_fields = ('id',)


class ProductsGroupSerializer(serializers.ModelSerializer):

    groups = NestedProductGroup(many=True, read_only=True)
    is_parent = serializers.SerializerMethodField()

    class Meta:
        model = ProductGroup
        fields = (
            "id",
            "name",
            "parent_group",
            "groups",
            "is_parent",
            "is_product",

            "color",
            "image",
            "rank",
            "created",
            "updated",
        )

    def create(self, validated_data):
        """Create a new user with encrypted password and return it"""
        print("validated_data")
        return ProductGroup.objects.create(**validated_data)

    def get_is_parent(self, obj):
        return obj.parent_group is None


class CommonSerializer(serializers.Serializer):

    @classmethod
    def get_serializer(cls, model):
        if model == Product:
            return ProductSerializer
        elif model == ProductGroup:
            return ProductsGroupSerializer

    def to_representation(self, instance):
        serializer = self.get_serializer(instance.__class__)
        return serializer(instance, context=self.context).data
