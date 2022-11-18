from django.urls import path, include
from rest_framework import routers


# router = routers.DefaultRouter()

urlpatterns = [
    # path('', include(router.urls)),
    path("product/", include("products.urls")),
    path("customers/", include("customers.urls")),
    path("orders/", include("orders.urls")),
    path("taxes/", include("taxes.urls")),


]
