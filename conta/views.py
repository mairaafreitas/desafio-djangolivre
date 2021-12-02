from rest_framework import viewsets

from conta.models import Conta
from conta.serializer import ContaSerializer


class ContaViewSet(viewsets.ModelViewSet):
    queryset = Conta.objects.all()
    serializer_class = ContaSerializer
