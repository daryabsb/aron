from rest_framework import serializers
from core.models import Barcode, Product, ProductGroup


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = "__all__"


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


class ProductsGroupSerializer(serializers.ModelSerializer):

    groups = NestedProductGroup(many=True, read_only=True)

    class Meta:
        model = ProductGroup
        fields = (
            "id",
            "name",
            "parent_group",
            "groups",
            "color",
            "image",
            "rank",
            "created",
            "updated",
        )
