from rest_framework import serializers

from core.models import Tax, ProductTax, DocumentItemTax


class TaxSerializer(serializers.ModelSerializer):

    class Meta:
        model = Tax
        fields = "__all__"
        read_only_fields = ("id",)


class ProductTaxSerializer(serializers.ModelSerializer):

    tax = TaxSerializer()
    class Meta:
        model = ProductTax
        fields = "__all__"
        read_only_fields = ("id",)



class DocumentItemTaxSerializer(serializers.ModelSerializer):

    tax = TaxSerializer()
    class Meta:
        model = DocumentItemTax
        fields = "__all__"
        read_only_fields = ("id",)
