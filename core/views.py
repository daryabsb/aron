# from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic.base import TemplateView
# Create your views here.


class IndexTemplateView(LoginRequiredMixin, TemplateView):
    template_name = "index.html"


def my_test(request):

    # context = {'What is:': "IT is nothing"}
    return HttpResponse('My Test')
