"""app URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include, re_path
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import LoginView
from core.forms import CustomLoginForm, CustomRegistrationForm
from core.views import IndexTemplateView, logout_view, signup
from core.api.views import PrinterNamesList

urlpatterns = [
    path(
        "login/", LoginView.as_view(authentication_form=CustomLoginForm), name="login"
    ),
    path("signup/", signup, name="signup"),
    path("logout/", logout_view),
    path("api/core/", include("core.api.urls")),
    path("admin/", admin.site.urls),
    path('printers/', PrinterNamesList.as_view()),
    path("api/user/", include("user.api.urls")),
    path("api/product/", include("products.urls")),
    path("api/customers/", include("customers.urls")),
    path("api/orders/", include("orders.urls")),
    # path("accounts/", include("django.contrib.auth.urls")),
]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += [re_path(r"^.*$", IndexTemplateView.as_view(), name="entry")]
