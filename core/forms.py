from django.contrib.auth.forms import AuthenticationForm


class CustomLoginForm(AuthenticationForm):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['username'].widget.attrs.update(
            {
                'class': 'form-control rounded-left',
                'value': 'username',
                'autocomplete': False,
                'placeholder': 'Darya Ibrahim'

            }
        )
        # self.fields['username'].widget.attrs.update(
        #     {'class': 'form-control rounded-left'})
        self.fields['password'].widget.attrs.update(
            {
                'class': 'form-control rounded-left',
                'placeholder': 'Enter some passwords'

            }
        )
