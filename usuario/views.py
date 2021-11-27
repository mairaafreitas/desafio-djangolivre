from rest_framework import viewsets
from usuario.models import Usuario
from usuario.serializer import UsuarioSerializer

class UsuarioViewSet(viewsets.ModelViewSet):
    listar_usuarios = Usuario.objects.all()
    serializer_class = UsuarioSerializer

   

