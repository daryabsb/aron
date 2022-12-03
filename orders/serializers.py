from rest_framework import serializers
from core.models import (PosOrder, PosOrderItem, PaymentType,
                            CashRegister,)
from products.serializers import ProductSerializer


class GenerateNumberSerializer(serializers.Serializer):
    number = serializers.IntegerField()


class PosOrderItemSerializer(serializers.ModelSerializer):

    # product = ProductSerializer(required=False)

    class Meta:
        model = PosOrderItem
        fields = '__all__'
        # read_only_Fields = ('id')
        required_fields = ('number','product','order','discount','discount_type','quantity','price')


class PosOrderSerializer(serializers.ModelSerializer):

    items = PosOrderItemSerializer(many=True, required=False)
    number = serializers.CharField(required=False)

    class Meta:
        model = PosOrder
        fields = ('number', 'discount', 'discount_type',
                  'total', 'status', 'items', 'created', 'updated')
        # read_only_Fields = ('id')

    def create(self, validated_data):
        print("validated_data",validated_data)
        order = PosOrder.objects.create(**validated_data)
       
        return order


class PaymentTypeSerializer(serializers.ModelSerializer):

    class Meta:
        model = PaymentType
        fields = '__all__'


class CashRegisterSerializer(serializers.ModelSerializer):

    class Meta:
        model = CashRegister
        fields = '__all__'
