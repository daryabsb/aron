from urllib import request
from django.urls import path, include


from .views import (
    CreateUserView, CreateTokenView, ManageUserView, 
    ChangePasswordView,User_logout
    )

urlpatterns = [
    path('user/create/', CreateUserView.as_view(), name='create'),
    path('user/token/', CreateTokenView.as_view(), name='token'),
    path('user/logout/', User_logout),
    path('user/me/', ManageUserView.as_view(), name='me'),
    path('user/change-password/',
         ChangePasswordView.as_view(), name='password-change'),
]
