from rest_framework import serializers
from core.models import Barcode, PosOrder, PosOrderItem, Product


class ProductSerializer(serializers.ModelSerializer):

    class Meta:
        model = Product
        fields = '__all__'


class BarcodeSerializer(serializers.ModelSerializer):

    class Meta:
        model = Barcode
        fields = ('id', 'product', 'value', 'created', 'updated')
        read_only_Fields = ('id')


class PosOrderSerializer(serializers.ModelSerializer):

    class Meta:
        model = PosOrder
        fields = '__all__'


class PosOrderItemSerializer(serializers.ModelSerializer):

    class Meta:
        model = PosOrderItem
        fields = '__all__'
