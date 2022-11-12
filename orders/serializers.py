from rest_framework import serializers
from core.models import PosOrder, PosOrderItem
from products.serializers import ProductSerializer


class PosOrderItemSerializer(serializers.ModelSerializer):

    product = ProductSerializer()

    class Meta:
        model = PosOrderItem
        fields = '__all__'
        read_only_Fields = ('id')


class PosOrderSerializer(serializers.ModelSerializer):

    items = PosOrderItemSerializer(many=True, required=False)
    number = serializers.CharField(required=False)

    class Meta:
        model = PosOrder
        fields = ('id', 'number', 'discount', 'discount_type',
                  'total', 'status', 'items', 'created', 'updated')
        read_only_Fields = ('id')
