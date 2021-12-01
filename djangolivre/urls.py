from conta.views import ContaViewSet
from transferencia.models import Transferencia
from transferencia.views import TransferenciaViewSet
from usuario.views import UsuarioViewSet
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from django.contrib import admin

router = DefaultRouter()

router.register(r'conta', ContaViewSet)
router.register(r'usuario', UsuarioViewSet)
router.register(r'transferencia', TransferenciaViewSet)

urlpatterns = [
path('', include(router.urls)),
path('admin/', admin.site.urls)
]

