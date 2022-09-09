from django.urls import path, include
from rest_framework import routers


from .views import BarcodeViewset, ProductViewset

router = routers.DefaultRouter()

router.register('all',ProductViewset)
router.register('barcodes', BarcodeViewset)

app_name = 'product'

urlpatterns = [
    path('', include(router.urls)),
    
]
