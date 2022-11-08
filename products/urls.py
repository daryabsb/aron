from django.urls import path, include
from rest_framework import routers


from .views import (
    BarcodeViewset,
    ProductGroupViewset,
    ProductViewset,
    StockViewset,
)

router = routers.DefaultRouter()

router.register("all", ProductViewset)
router.register("groups", ProductGroupViewset,basename='group')
router.register("barcodes", BarcodeViewset)
router.register("stocks", StockViewset)

app_name = "product"


urlpatterns = [
    path("", include(router.urls)),
]
