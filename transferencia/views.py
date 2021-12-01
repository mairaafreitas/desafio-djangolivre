from rest_framework import serializers, viewsets
from transferencia.models import Transferencia 
from transferencia.serializer import TransferenciaSerializer

class TransferenciaViewSet(viewsets.ModelViewSet):
    queryset = Transferencia.objects.all()
    serializer_class = TransferenciaSerializer


