# Generated by Django 4.1 on 2022-09-10 09:50

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0010_currency_country_company'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='currency',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='products', to='core.currency'),
            preserve_default=False,
        ),
    ]