from django.db import models
from django.utils import timezone
from conta.models import Conta
from usuario.models import Usuario

class Transferencia(models.Model):
    favorecido = models.ForeignKey(Conta, on_delete=models.DO_NOTHING)
    remetente = models.ForeignKey(Usuario, on_delete=models.DO_NOTHING)
    data = timezone.localdate()

