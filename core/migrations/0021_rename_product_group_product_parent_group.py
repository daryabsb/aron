# Generated by Django 4.1 on 2022-11-08 09:30

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0020_alter_startingcash_options_stock_quantity'),
    ]

    operations = [
        migrations.RenameField(
            model_name='product',
            old_name='product_group',
            new_name='parent_group',
        ),
    ]