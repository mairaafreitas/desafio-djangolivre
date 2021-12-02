from rest_framework import serializers, viewsets
from transferencia.models import Transferencia 
from transferencia.serializer import TransferenciaSerializer
from rest_framework.decorators import api_view
from conta.models import Conta
from usuario.models import Usuario
from usuario.serializer import UsuarioSerializer

class TransferenciaViewSet(viewsets.ModelViewSet):
    queryset = Transferencia.objects.all()
    serializer_class = TransferenciaSerializer

@api_view(['POST'])
def executa_transferencia(request):
    print(request.data)    
    transf = Transferencia()
    transf.valor

    remetente = Usuario.objects.get(conta=request.data.get('remetente'))
    favorecido = Usuario.objects.get(conta=request.data.get('favorecido'))
    valor_transferencia = request.data.get('valor')
    print("Carteira do cliente: " + str(remetente.saldo))
    print("Valor da : " + str(favorecido.saldo))

    if remetente.saldo >= valor_transferencia:
        remetente.saldo -= valor_transferencia  
        favorecido.saldo += valor_transferencias
        
        usuario_remetente = UsuarioSerializer(data=remetente)
        if usuario_remetente.is_valid():
            usuario_remetente.save()

        usuario_favorecido = UsuarioSerializer(data=favorecido)
        if usuario_favorecido.is_valid():
            usuario_favorecido.save()

        serializer = TransferenciaSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()

        print("Fez Transferência")

        return Response(serializer.data, status=status.HTTP_201_CREATED)   

    return Response("Cliente não possui dinheiro suficiente para a transferência", status=status.HTTP_412_PRECONDITION_FAILED)    



