from rest_framework import serializers
from core.models import Barcode, Product, ProductGroup


class ProductSerializer(serializers.ModelSerializer):

    class Meta:
        model = Product
        fields = '__all__'


class BarcodeSerializer(serializers.ModelSerializer):

    class Meta:
        model = Barcode
        fields = ('id', 'product', 'value', 'created', 'updated')
        read_only_Fields = ('id')


class ProductsGroupSerializer(serializers.ModelSerializer):

    class Meta:
        model = ProductGroup
        fields = '__all__'
