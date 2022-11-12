# from django.shortcuts import render


from django.contrib.auth import login, authenticate
from django.shortcuts import render, redirect
from .forms import RegisterForm
from django.contrib.auth.forms import UserCreationForm
from urllib import request
from django.http import HttpResponse
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic.base import TemplateView
from django.views import generic
from django.contrib.auth import logout
from django.shortcuts import redirect
from django.contrib.auth import get_user_model
from .forms import CustomRegistrationForm

# Create your views here.


class IndexTemplateView(LoginRequiredMixin, TemplateView):
    template_name = "index.html"


def my_test(request):

    # context = {'What is:': "IT is nothing"}
    return HttpResponse('My Test')


def logout_view(request):
    request.session['fav_color'] = 'blue'
    logout(request)
    # Redirect to a success page.
    return redirect('login')

# class CreateUser(generic.CreateView):
#     model= get_user_model()
#     template_name: 'signup.html'
#     fields= ['name','email','password']
#     success_url = '/'


def signup(request):
    context = {}
    if request.method == 'POST':
        name = request.POST.get('name', '')
        email = request.POST.get('email', '')
        password = request.POST.get('password', '')
        print(email)

        user = get_user_model().objects.create_user(name=name, email=email)
        user.set_password(password)

        print(user)
        if user is not None:
            user.save()

            user = authenticate(username=email, password=password)
            login(request, user)
            context = {user: user}

            return redirect('/')
    return render(request, 'registration/signup.html', context)
