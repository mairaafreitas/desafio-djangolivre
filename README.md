# Desafio final do programa Construdelas

## Descrição
O desafio proposto pela Juntos Somos Mais, como parte do programa ConstruDelas, é a criação de uma API para gerenciar as transações do banco DjangoLivre.

Esse sistema que criamos, permite o cadastro de novos clientes que ficará atrelado a uma conta bancária. No DjangoLivre é possível fazer transferências de um cliente para outro, com histórico de transações entre as contas para compliance.

## Configurar a aplicação para rodar localmente:
Clone o repositório para criar uma cópia local no seu computador 

	git clone https://github.com/mairaafreitas/desafio-djangolivre

## Inicialização
1. Abra o diretório clonado no seu terminal

   
2. Para que a estrutura do banco de dados seja criada, execute o comando:
	
    ``python manage.py migrate``
   
3. Crie o seu usuário para acessar o painel administrativo
   
	``python manage.py createsuperuser``
   
4. Para verificar se está funcionando, acesse:
   
	``localhost:8000/``
   
## Endpoints da API
GET  `localhost:8000/usuario/`
- Lista todos os usuários

POST `localhost:8000/usuario/`
- Cria um usuário

- Payload:

```
{"nome": "Maria",
  "cpf": "12345678901",
  "telefone": "23998589761",
  "data_nascimento": "1992-01-01",
  "conta": 5
  }

```

GET localhost:8000/conta/
- Lista todas as contas

POST localhost:8000/conta/
- Cria uma conta com saldo
- Payload:
```
{
  "agencia": "0001",
  "conta": "3245",
  "saldo": "3.00",
  "id":5
  }
```

GET localhost:8000/historico/
- Lista todo o histórico de transações

POST localhost:8000/transferencia/
- Realiza uma transação entre clientes do banco
- Payload:
```
{   "remetente": "359467",
    "favorecido": "945813",
    "valor": "10.00"
}
```
- Responseda API:
```
{
    "remetente": "359467",
    "favorecido": "945813",
    "valor": 10.0,
    "data": "2021-12-03T00:30:38.781810Z"
}
```


## Autoras
* [**Andreia Baumgratz**](https://github.com/andbaumgartner)
* [**Beatriz Magalhães**](https://github.com/Beatrizsms)
* [**Giullia Ramos**](https://github.com/jujups)
* [**Jacqueline Marques**](https://github.com/JacquelineMarques)
* [**Maíra Freitas**](https://github.com/mairaafreitas)
* [**Marta Lima**](https://github.com/Marta-Lima)