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
    is_parent = serializers.SerializerMethodField()

    class Meta:
        model = ProductGroup
        fields = (
            "id",
            "name",
            "parent_group",
            "groups",
            "is_parent",
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
