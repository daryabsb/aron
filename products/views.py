from rest_framework import permissions, viewsets
from django.db.models import Q
from core.models import Barcode, Product, ProductGroup
from .serializers import (
    BarcodeSerializer,
    ProductSerializer,
    ProductsGroupSerializer,
)


class ProductViewset(viewsets.ModelViewSet):
    serializer_class = ProductSerializer
    queryset = Product.objects.all()
    permission_classes = (permissions.IsAuthenticated,)

    def get_queryset(self):
        queryset = Product.objects.all()

        # PERFORM FILTER BY SEARCH INPUT
        # conditions = Q()
        id = self.request.query_params.get("group", None)
        # print(keywords)
        if id:
            queryset = Product.objects.filter(product_group=id)

        return queryset

    def perform_create(self, serializer):
        """Create a new product"""
        serializer.save(user=self.request.user)


class ProductGroupViewset(viewsets.ModelViewSet):
    serializer_class = ProductsGroupSerializer
    queryset = (
        ProductGroup.objects.filter(rank__lte=5)
        .filter(rank__gt=0)
        .filter(products__isnull=False)
        .distinct()
    )
    permission_classes = (permissions.IsAuthenticated,)

    def perform_create(self, serializer):
        """Create a new product group"""
        serializer.save(user=self.request.user)


class AllProductGroupViewset(viewsets.ModelViewSet):
    serializer_class = ProductsGroupSerializer
    queryset = ProductGroup.objects.all()
    permission_classes = (permissions.IsAuthenticated,)


class BarcodeViewset(viewsets.ModelViewSet):
    serializer_class = BarcodeSerializer
    queryset = Barcode.objects.all()
    permission_classes = (permissions.IsAuthenticated,)

    def perform_create(self, serializer):
        """Create a new Barcode"""
        serializer.save(user=self.request.user)
