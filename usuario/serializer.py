from .models import Usuario
from rest_framework import serializers

class UsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model= Usuario
        fields= ['nome', 'cpf','telefone','data_nascimento', 'conta']
    