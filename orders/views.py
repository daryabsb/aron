import uuid
from rest_framework import permissions, viewsets
from .serializers import PosOrderItemSerializer, PosOrderSerializer
from core.models import PosOrder, PosOrderItem


class PosOrderViewset(viewsets.ModelViewSet):
    serializer_class = PosOrderSerializer
    queryset = PosOrder.objects.all()
    permission_classes = (permissions.IsAuthenticated,)

    def perform_create(self, serializer):
        """Create a new order"""
        number = serializer.validated_data.pop('number', None)

        if not number:
            number = uuid.uuid4()
            print(number)
        serializer.save(user=self.request.user, number=number)


class PosOrderItemViewset(viewsets.ModelViewSet):
    serializer_class = PosOrderItemSerializer
    queryset = PosOrderItem.objects.all()
    permission_classes = (permissions.IsAuthenticated,)

    def perform_create(self, serializer):
        """Create a new order item"""
        serializer.save(user=self.request.user)
