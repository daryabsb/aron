# Generated by Django 4.1 on 2022-11-19 04:43

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0005_alter_producttax_unique_together'),
    ]

    operations = [
        migrations.AlterField(
            model_name='producttax',
            name='product',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='productTaxes', to='core.product'),
        ),
    ]
