from datetime import datetime
from django.db import models
from django.utils import timezone
from conta.models import Conta
from usuario.models import Usuario
from datetime import datetime

class Transferencia(models.Model):
    favorecido = models.ForeignKey(Conta, on_delete=models.DO_NOTHING, related_name="conta_favorecido")
    remetente = models.ForeignKey(Conta, on_delete=models.DO_NOTHING, related_name="conta_remetente")
    valor = models.DecimalField(decimal_places=2, max_digits=12, blank=False)
    data = models.DateTimeField(auto_now_add=True, serialize=True)

