from django.urls import path, include
from rest_framework import routers


from .views import (PosOrderItemViewset, PosOrderViewset, GenerateNumberView,
                    PaymentTypeViewset,CashRegisterViewset)

router = routers.DefaultRouter()

router.register('all', PosOrderViewset)
router.register('items', PosOrderItemViewset)
router.register('payment-types', PaymentTypeViewset)
router.register('counters', CashRegisterViewset)

# router.register('number', GenerateNumberView)

app_name = 'orders'


urlpatterns = [
    path('', include(router.urls)),
    path('number/', GenerateNumberView.as_view(), name='number')

]
