from django.contrib.auth.forms import AuthenticationForm
from django import forms



class CustomLoginForm(AuthenticationForm):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['username'].widget.attrs.update(
            {
                'type': 'Email',
                'class': 'border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150',
                'value': 'username',
                'autocomplete': False,
                'placeholder': 'Email'

            }
        )
        # self.fields['username'].widget.attrs.update(
        #     {'class': 'form-control rounded-left'})
        self.fields['password'].widget.attrs.update(
            {
                'class': 'border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150',
                'placeholder': 'Enter some passwords'

            }
        )

class CustomRegistrationForm(forms.Form):
    name = forms.CharField(max_length=100)
    email = forms.EmailField()

    

from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.contrib.auth.models import User

class RegisterForm(UserCreationForm):
    name = forms.CharField(label = "First name")
    email = forms.EmailField(label = "Email")
    email = forms.EmailField(label = "Email")

    class Meta:
        model = User
        fields = ("name", "email", "password", )
    
    # def __init__(self, *args, **kwargs):
    #     super().__init__(*args, **kwargs)
    #     self.fields['username'].widget.attrs.update(
    #         {
    #             'type': 'Email',
    #             'class': 'border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150',
    #             'value': 'username',
    #             'autocomplete': False,
    #             'placeholder': 'Email'

    #         }
    #     )
    #     self.fields['name'].widget.attrs.update(
    #         {
    #             'type': 'text',
    #             'class': 'border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150',
    #             'value': 'name',
    #             'autocomplete': False,
    #             'placeholder': 'Full Name'

    #         }
    #     )
    #     self.fields['password'].widget.attrs.update(
    #         {
    #             'class': 'border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-600 bg-white rounded text-sm shadow focus:outline-none focus:ring w-full ease-linear transition-all duration-150',
    #             'placeholder': 'Enter some passwords'

    #         }
    #     )
