from django.db import models
import random

def conta_random(): 
    return str(random.randint(000000, 999999))

class Conta(models.Model):
    agencia = models.CharField(default="0001", max_length=4, blank=False, editable=False)
    conta = models.CharField(default=conta_random, max_length=6, serialize=False)
    saldo = models.DecimalField(decimal_places=2, max_digits=12, blank=False)

    def __str__(self) -> str:
        return self.conta

