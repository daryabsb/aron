from rest_framework import permissions, viewsets
from core.models import Barcode, Product, PosOrder, PosOrderItem
from .serializers import BarcodeSerializer, ProductSerializer


class ProductViewset(viewsets.ModelViewSet):
    serializer_class = ProductSerializer
    queryset = Product.objects.all()
    permission_classes = (permissions.IsAuthenticated,)

    def perform_create(self, serializer):
        """Create a new product"""
        serializer.save(user=self.request.user)


class BarcodeViewset(viewsets.ModelViewSet):
    serializer_class = BarcodeSerializer
    queryset = Barcode.objects.all()
    permission_classes = (permissions.IsAuthenticated,)

    def perform_create(self, serializer):
        """Create a new Barcode"""
        serializer.save(user=self.request.user)

