from rest_framework import serializers

from .models import Transferencia


class TransferenciaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Transferencia
        fields = ["remetente", "favorecido", "valor"]
