# Generated by Django 3.2.9 on 2021-11-30 23:10

import conta.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('conta', '0002_alter_conta_conta'),
    ]

    operations = [
        migrations.AlterField(
            model_name='conta',
            name='agencia',
            field=models.CharField(default='0001', editable=False, max_length=4),
        ),
        migrations.AlterField(
            model_name='conta',
            name='conta',
            field=models.CharField(default=conta.models.conta_random, max_length=6),
        ),
    ]
