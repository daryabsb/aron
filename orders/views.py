import uuid
import random
from datetime import date
from rest_framework import permissions, viewsets,status
from .serializers import PosOrderItemSerializer, PosOrderSerializer

from core.models import PosOrder, PosOrderItem

from rest_framework.views import APIView
from rest_framework.response import Response


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


class GenerateNumberView(APIView):
    # serializer_class = GenerateNumberSerializer
    # permission_classes = (permissions.IsAuthenticated,)

    def get(self, request, format=None):
        min = 100
        max = 3999
        digits = str(random.randint(min, max))
        digits = (len(str(max))-len(digits))*'0'+digits

        target = request.query_params.get('target', None)
        # print(request.user.id)
        # print(date.today().strftime("%A %d. %B %Y"))
        # print(date.today().strftime("%d%m%Y"))
        print(digits)
        if target:
            number = f'{target}-{request.user.id}-{date.today().strftime("%d%m%Y")}-01-{digits}'
            
            response = {number}
            return Response(response)
        return Response('not found',status=status.HTTP_204_NO_CONTENT)
