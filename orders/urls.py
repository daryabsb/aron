from django.urls import path, include
from rest_framework import routers


from .views import PosOrderItemViewset, PosOrderViewset

router = routers.DefaultRouter()

router.register('all', PosOrderViewset)
router.register('items', PosOrderItemViewset)

app_name = 'orders'


urlpatterns = [
    path('', include(router.urls)),

]
