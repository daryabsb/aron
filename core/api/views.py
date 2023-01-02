
import subprocess
from rest_framework.views import APIView

from rest_framework.response import Response
from rest_framework import status
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


class PrinterNamesList(APIView):

    def get(self, request, format=None):
        """
        Return a list of all printers.
        """
        printer_list = []
        data = subprocess.check_output(
            ['wmic', 'printer', 'list', 'brief', ]).decode('utf-8').split('\r\r\n')
        data = data[1:]

        for line in data:
            for printer_name in line.split("  "):
                if printer_name != "":
                    # print(printer_name)
                    printer_list.append(printer_name)
                    break

        # print("PRINTERS")
        return Response(printer_list)
