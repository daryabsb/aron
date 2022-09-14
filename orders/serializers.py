from rest_framework import serializers
from core.models import PosOrder, PosOrderItem


class PosOrderItemSerializer(serializers.ModelSerializer):

    class Meta:
        model = PosOrderItem
        fields = '__all__'
        read_only_Fields = ('id')


class PosOrderSerializer(serializers.ModelSerializer):

    items = PosOrderItemSerializer(many=True, required=False)
    number = serializers.CharField(required=False)

    class Meta:
        model = PosOrder
        fields = ('id', 'number', 'discount',
                  'discount_type', 'total', 'items')
        read_only_Fields = ('id')
