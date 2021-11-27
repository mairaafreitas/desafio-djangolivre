from django.db import models
from conta.models import Conta

class Usuario(models.Model):
    nome = models.CharField(max_length=80, blank=False)
    cpf = models.CharField(max_length=11, blank=False)
    data_nascimento = models.DateField(blank=False)
    telefone = models.CharField(max_length=11, blank=False)
    conta = models.ForeignKey(Conta, on_delete=models.CASCADE)

    def __str__(self) -> str:
        return self.nome

