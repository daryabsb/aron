# Generated by Django 4.1 on 2022-11-08 11:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0022_product_is_product'),
    ]

    operations = [
        migrations.AddField(
            model_name='productgroup',
            name='is_product',
            field=models.BooleanField(default=False),
        ),
    ]