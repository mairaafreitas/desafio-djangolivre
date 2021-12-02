from .models import Transferencia
from rest_framework import serializers

class TransferenciaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Transferencia
        fields = ['remetente', 'favorecido', 'valor']
