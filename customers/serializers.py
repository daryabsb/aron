from rest_framework import serializers
from core.models import Customer


class CustomerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Customer
        fields = (
            "id",
            "name",
            "code",
            "is_customer",
            "is_supplier",
            "created",
            "updated",
        )
        read_only_Fields = "id"
