# Generated by Django 3.2.9 on 2021-12-02 22:31

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('transferencia', '0002_transferencia_valor'),
    ]

    operations = [
        migrations.AddField(
            model_name='transferencia',
            name='data',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]
