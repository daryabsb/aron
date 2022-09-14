from django.contrib.auth.models import BaseUserManager


class UserManager(BaseUserManager):

    def create_user(self, email, password=None, name=None, **extra_fields):
        # Creates and save a new user
        if not email:
            raise ValueError('Users must have an email address!')

        user = self.model(email=self.normalize_email(email), **extra_fields)
        user.set_password(password)
        user.name = name
        user.save(using=self._db)

        return user

    def create_superuser(self, email, password):
        # Creates and save a new superuser
        user = self.create_user(email, password)
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user

class OrderManager(BaseUserManager):

    def create_order(self, number=None, **extra_fields):
        # Creates and save a new user
        if not number:
            raise ValueError('Users must provide a number for an order to be created!')

        order = self.model(number=self.number, **extra_fields)
        order.save(using=self._db)

        return order
