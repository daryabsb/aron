from django.urls import path, include
from rest_framework import routers


from .views import (BarcodeViewset, PosOrderItemViewset, PosOrderViewset,
                    ProductViewset,)

router = routers.DefaultRouter()

router.register('all', ProductViewset)
router.register('barcodes', BarcodeViewset)
router.register('orders', PosOrderViewset)
router.register('order/items', PosOrderItemViewset)

app_name = 'product'


urlpatterns = [
    path('', include(router.urls)),

]
