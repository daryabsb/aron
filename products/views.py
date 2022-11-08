from rest_framework import permissions, viewsets
from rest_framework.views import APIView
from rest_framework import status
from django.shortcuts import get_object_or_404
from rest_framework.response import Response
from django.db.models import Q
from itertools import chain
# from django.db.models import Q
from core.models import Barcode, Product, ProductGroup, Stock
from .serializers import (
    BarcodeSerializer,
    ProductSerializer,
    ProductsGroupSerializer,
    StockSerializer,
    CommonSerializer,
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
# class ProductGroupViewset(APIView):

#     def get(self, request, pk=None):
#         group = ProductsGroupSerializer(ProductGroup.objects.get(pk=pk)).data
#         # children = ProductsGroupSerializer(ProductGroup.objects.filter(parent_group=pk))
#         products = ProductSerializer(Product.objects.filter(product_group=pk)).data

#         # print(Response([group, children,products], status=status.HTTP_200_OK))
#         return Response([group,products], status=status.HTTP_200_OK)


class ProductGroupViewset(viewsets.ModelViewSet):
    # serializer_class = ProductsGroupSerializer
    serializer_class = CommonSerializer
    queryset = ProductGroup.objects.all()
    permission_classes = (permissions.IsAuthenticated,)

    def get_queryset(self):
        queryset = ProductGroup.objects.filter(parent_group=None)

        # kwarg_id = self.kwargs.get('pk', None)
        parent_id = self.request.query_params.get('group', None)

        if parent_id:

            # queryset = ProductGroup.objects.filter(parent_group=parent_id)
            # group = ProductGroup.objects.get(id=parent_id)
            # queryset |= ProductGroup.objects.filter(parent_group=group.id)
            children = ProductGroup.objects.filter(parent_group=parent_id)
            products = Product.objects.filter(parent_group=parent_id)
            queryset = chain(children, products)
            print(queryset)
            # products = Product.objects.filter(product_group=parent_id)

            return queryset

        # elif kwarg_id:
        #     queryset = ProductGroup.objects.filter(pk=kwarg_id)

        #     return queryset
            '''

            '''
        return queryset

    # def get_serializer_class(self):
    #     obj = self.get_object()
    #     # is_product =  or None
    #     if obj.is_product:
    #         return ProductSerializer
    #     return ProductsGroupSerializer

    def perform_create(self, serializer):
        """Create a new product group"""

        print("serializer", serializer)
        serializer.save(user=self.request.user)


'''
        conditions = Q()
        id = self.kwargs.get('pk', None)
        # print(keywords)
        if id:
            
            # print(keywords_list)
            for word in keywords_list:
                conditions |= Q(name__icontains=word) | Q(email__icontains=word)
    
            if conditions:
                # print(type(conditions))
                queryset = User.objects.filter(conditions)
        


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


'''

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


'''
# from django.http import JsonResponse
# class ProductGroupViewset(viewsets.ViewSet):
    # serializer_class = ProductsGroupSerializer
    # queryset = ProductGroup.objects.all()
    # permission_classes = (permissions.IsAuthenticated,)
    # authentication_classes = [authentication.TokenAuthentication]
    # permission_classes = [permissions.IsAdminUser]

    # def list(self, request):
    #     queryset = ProductGroup.objects.all()
    #     serializer = ProductsGroupSerializer(queryset, many=True)
    #     return Response(serializer.data)

    # def retrieve(self, request, pk=None):
    #     queryset = ProductGroup.objects.all()
        # group = get_object_or_404(queryset, pk=pk)
        # group = list(ProductGroup.objects.filter(id=pk).values())
        # children = list(ProductGroup.objects.filter(parent_group=pk).values())
        # products = list(Product.objects.filter(product_group=pk).values())
        # children_serializer = ProductsGroupSerializer(children)
        products_serializer = ProductSerializer(products)
        # return Response(products_serializer.data)
        # return JsonResponse({'group':group,'groups':children,'products':products},safe=False)
'''
