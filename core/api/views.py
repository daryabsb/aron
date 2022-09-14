from rest_framework import permissions, viewsets
from core.models import Product, PosOrder, PosOrderItem
from .serializers import (ProductSerializer,
                          PosOrderSerializer,
                          PosOrderItemSerializer,
                          )


class ProductViewset(viewsets.ModelViewSet):
    serializer_class = ProductSerializer
    queryset = Product.objects.all()
    permission_classes = (permissions.IsAuthenticated,)


class PosOrder(viewsets.ModelViewSet):
    serializer_class = PosOrderSerializer
    queryset = PosOrder.objects.all()
    permission_classes = (permissions.IsAuthenticated,)


class PosOrderItem(viewsets.ModelViewSet):
    serializer_class = PosOrderItemSerializer
    queryset = PosOrderItem.objects.all()
    permission_classes = (permissions.IsAuthenticated,)
