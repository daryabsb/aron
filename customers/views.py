from rest_framework import permissions, viewsets
from core.models import Customer

from customers.serializers import CustomerSerializer


# Create your views here.


class CustomerViewset(viewsets.ModelViewSet):
    serializer_class = CustomerSerializer
    queryset = Customer.objects.all()
    permission_classes = (permissions.IsAuthenticated,)

    def perform_create(self, serializer):
        """Create a new product group"""

        print("serializer", serializer)
        serializer.save(user=self.request.user)
