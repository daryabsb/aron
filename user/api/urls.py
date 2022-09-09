from django.urls import path


from .views import (
    CreateUserView, CreateTokenView, ManageUserView, 
    ChangePasswordView
    )


urlpatterns = [
    path('create/', CreateUserView.as_view(), name='create'),
    path('token/', CreateTokenView.as_view(), name='token'),
    path('me/', ManageUserView.as_view(), name='me'),
    path('change-password/',
         ChangePasswordView.as_view(), name='password-change'),
]
