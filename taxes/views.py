from rest_framework import permissions, viewsets

from core.models import Tax, ProductTax, DocumentItemTax

from .serializers import TaxSerializer, ProductTaxSerializer, DocumentItemTaxSerializer


class TaxViewset(viewsets.ModelViewSet):
    serializer_class = TaxSerializer
    queryset = Tax.objects.all()
    permission_classes = (permissions.IsAuthenticated,)


class ProductTaxViewset(viewsets.ModelViewSet):
    serializer_class = ProductTaxSerializer
    queryset = ProductTax.objects.all()
    permission_classes = (permissions.IsAuthenticated,)


class DocumentItemTaxViewset(viewsets.ModelViewSet):
    serializer_class = DocumentItemTaxSerializer
    queryset = DocumentItemTax.objects.all()
    permission_classes = (permissions.IsAuthenticated,)
