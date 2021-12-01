from django.db import models
from django.utils import timezone
from conta.models import Conta
from usuario.models import Usuario

class Transferencia(models.Model):
    favorecido = models.ForeignKey(Conta, on_delete=models.DO_NOTHING)
    remetente = models.ForeignKey(Usuario, on_delete=models.DO_NOTHING)
    valor = models.DecimalField(decimal_places=2, max_digits=12, blank=False)
    data = timezone.localdate()

