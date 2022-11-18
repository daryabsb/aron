from django.urls import path, include
from rest_framework import routers


from .views import (
    TaxViewset,
    ProductTaxViewset,
    DocumentItemTaxViewset,
)

router = routers.DefaultRouter()

router.register("taxes", TaxViewset)
router.register("product-taxes", ProductTaxViewset)
router.register("document-item-taxes", DocumentItemTaxViewset)

app_name = "taxes"


urlpatterns = [
    path("", include(router.urls)),
]
