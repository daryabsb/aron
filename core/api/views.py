from rest_framework import permissions, viewsets
from core.models import Product
from .serializers import ProductSerializer


class ProductViewset(viewsets.ModelViewSet):
    serializer_class = ProductSerializer
    queryset = Product.objects.all()
    permission_classes = (permissions.IsAuthenticated,)
