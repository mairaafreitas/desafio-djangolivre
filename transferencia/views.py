from rest_framework.response import Response
from rest_framework import serializers, viewsets
from transferencia.models import Transferencia 
from transferencia.serializer import TransferenciaSerializer
from rest_framework.decorators import api_view
from conta.models import Conta
from usuario.models import Usuario
from conta.serializer import ContaSerializer
from decimal import Decimal
from rest_framework import status
from datetime import datetime

class TransferenciaViewSet(viewsets.ModelViewSet):
    queryset = Transferencia.objects.all()
    serializer_class = TransferenciaSerializer

@api_view(['POST'])
def executa_transferencia(request):
    print(request.data)
    exit

    remetente = Conta.objects.get(conta=request.data.get('remetente'))
    favorecido = Conta.objects.get(conta=request.data.get('favorecido'))
    valor_transferencia = Decimal(request.data.get('valor'))

    print("Carteira do cliente: " + str(remetente.saldo))
    print("Valor da : " + str(favorecido.saldo))

    if remetente.saldo >= valor_transferencia:

        remetente.saldo -= valor_transferencia  
        favorecido.saldo += valor_transferencia
        
        transferencia_serializer = TransferenciaSerializer(data={"remetente":remetente.id,
        "favorecido":favorecido.id,
        "valor":valor_transferencia,
        })
        if not transferencia_serializer.is_valid():
            return Response("Erro ao realizar a transferência", status=status.HTTP_400_BAD_REQUEST)
        
        transferencia = transferencia_serializer.save()
        remetente.save()
        favorecido.save()
        
        print("Fez Transferência")
        response = {"remetente":remetente.conta,
        "favorecido":favorecido.conta,
        "valor":valor_transferencia,
        "data": transferencia.data
        }

        return Response(response, status=status.HTTP_201_CREATED)   

    return Response("Cliente não possui dinheiro suficiente para a transferência", status=status.HTTP_412_PRECONDITION_FAILED)    

