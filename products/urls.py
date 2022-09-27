from django.urls import path, include
from rest_framework import routers


from .views import (
    AllProductGroupViewset,
    BarcodeViewset,
    ProductGroupViewset,
    ProductViewset,
)

router = routers.DefaultRouter()

router.register("all", ProductViewset)
router.register("groups", ProductGroupViewset)
router.register("all-groups", AllProductGroupViewset)
router.register("barcodes", BarcodeViewset)

app_name = "product"


urlpatterns = [
    path("", include(router.urls)),
]
