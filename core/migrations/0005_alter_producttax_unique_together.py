# Generated by Django 4.1 on 2022-11-19 04:41

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0004_alter_producttax_product_alter_tax_code'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='producttax',
            unique_together={('product', 'tax')},
        ),
    ]
