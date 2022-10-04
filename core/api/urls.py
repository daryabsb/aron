from django.urls import path, include
from rest_framework import routers


router = routers.DefaultRouter()
# router.register('products',ProductViewset)

urlpatterns = [
    path('', include(router.urls))


]
