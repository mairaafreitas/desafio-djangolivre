from django.db import models
from random import randint

AGENCIA_DJANGOLIVRE = '0001'
CONTA_USUARIO =  randint(100000, 999999)

class Conta(models.Model):
    agencia = models.CharField(AGENCIA_DJANGOLIVRE, max_length=4, blank=False)
    conta = models.CharField(CONTA_USUARIO, max_length=6, blank=False)
    saldo = models.DecimalField(decimal_places=2, max_digits=12, blank=False)

    def __str__(self) -> str:
        return self.conta
