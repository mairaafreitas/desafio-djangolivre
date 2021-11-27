from django.db import models
from django.db.models.fields import CommaSeparatedIntegerField
from random import randint

AGENCIA_DJANGOLIVRE = '0001'
CONTA_USUARIO =  randint(100000, 999999)

class Usuario(models.Model):
    nome = models.CharField(max_length=80, blank=False)
    cpf = models.CharField(max_length=11, blank=False)
    data_nascimento = models.DateField(blank=False)
    telefone = models.CharField(max_length=11, blank=False)

    def __str__(self) -> str:
        return self.nome

class Conta(models.Model):
    agencia = models.CharField(AGENCIA_DJANGOLIVRE, max_length=4, blank=False)
    conta = models.CharField(CONTA_USUARIO, max_length=6, blank=False)
    usuario = models.OneToOneField(Usuario, on_delete=models.CASCADE, blank=False)
    saldo = models.DecimalField(decimal_places=2, max_digits=12, blank=False)

    def __str__(self) -> str:
        return self.conta