from rest_framework import serializers
from core.models import Product, PosOrder, PosOrderItem


class ProductSerializer(serializers.ModelSerializer):

    class Meta:
        model = Product
        fields = '__all__'


class PosOrderSerializer(serializers.ModelSerializer):

    class Meta:
        model = PosOrder
        fields = '__all__'


class PosOrderItemSerializer(serializers.ModelSerializer):

    class Meta:
        model = PosOrderItem
        fields = '__all__'
