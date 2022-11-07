from rest_framework import permissions, viewsets
from itertools import chain
# from django.db.models import Q
from core.models import Barcode, Product, ProductGroup, Stock
from .serializers import (
    BarcodeSerializer,
    ProductSerializer,
    ProductsGroupSerializer,
    StockSerializer,
)


class StockViewset(viewsets.ModelViewSet):
    serializer_class = StockSerializer
    queryset = Stock.objects.all()
    permission_classes = (permissions.IsAuthenticated,)

    def get_queryset(self):

        queryset = Stock.objects.all()

        return queryset

    def get_queryset(self):
        queryset = Stock.objects.all()

        # PERFORM FILTER BY SEARCH INPUT
        # conditions = Q()
        id = self.request.query_params.get("group", None)
        # print(keywords)
        if id:
            queryset = Stock.objects.filter(product__product_group=id)

        return queryset

    def perform_create(self, serializer):
        """Create a new product"""
        serializer.save(user=self.request.user)


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
    queryset = ProductGroup.objects.all()
    permission_classes = (permissions.IsAuthenticated,)

    def get_queryset(self):
        queryset = ProductGroup.objects.all()

        parent_id = self.kwargs.get('pk', None)

        if parent_id:
            children = ProductGroup.objects.filter(parent_group=parent_id)
            products = Product.objects.filter(product_group=parent_id)

            queryset = chain(children, products)
            print(type(queryset))
            return {children: children, products: products}
            # # children_products = Product.objects.filter(parent_group=)
            # for child in children:
            #     my_list.append(child)
            #     for product in products:
            #         my_list.append(product)

            # for my in my_list:
            #     print(type(my))
        # PERFORM FILTER BY SEARCH INPUT
        # conditions = Q()
        # children = self.request.query_params.get("children", None)
        # print(keywords)
        # if children:
        #     queryset = Product.objects.filter(parent_group=id)

        return queryset

    def perform_create(self, serializer):
        """Create a new product group"""

        print("serializer", serializer)
        serializer.save(user=self.request.user)


# class ProductGroupViewset(viewsets.ModelViewSet):
#     serializer_class = ProductsGroupSerializer
#     queryset = (
#         ProductGroup.objects.filter(rank__lte=5)
#         .filter(rank__gt=0)
#         .filter(products__isnull=False)
#         .distinct()
#     )
#     permission_classes = (permissions.IsAuthenticated,)

#     def perform_create(self, serializer):
#         """Create a new product group"""

#         print("serializer", serializer)
#         serializer.save(user=self.request.user)


# class AllProductGroupViewset(viewsets.ModelViewSet):
#     serializer_class = ProductsGroupSerializer
#     queryset = ProductGroup.objects.all()
#     permission_classes = (permissions.IsAuthenticated,)

#     def perform_create(self, serializer):
#         """Create a new product group"""
#         serializer.save(user=self.request.user)


class BarcodeViewset(viewsets.ModelViewSet):
    serializer_class = BarcodeSerializer
    queryset = Barcode.objects.all()
    permission_classes = (permissions.IsAuthenticated,)

    def perform_create(self, serializer):
        """Create a new Barcode"""
        serializer.save(user=self.request.user)
