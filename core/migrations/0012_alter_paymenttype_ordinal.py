# Generated by Django 4.1 on 2022-12-02 14:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0011_startingcash_cash_register'),
    ]

    operations = [
        migrations.AlterField(
            model_name='paymenttype',
            name='ordinal',
            field=models.SmallIntegerField(unique=True),
        ),
    ]
