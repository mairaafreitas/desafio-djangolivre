from conta.views import ContaViewSet
from django.contrib import admin
from django.urls import include, path
from rest_framework.routers import DefaultRouter
from transferencia.views import TransferenciaViewSet, executa_transferencia
from usuario.views import UsuarioViewSet

router = DefaultRouter()

router.register(r'conta', ContaViewSet)
router.register(r'usuario', UsuarioViewSet)
router.register(r'historico', TransferenciaViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('admin/', admin.site.urls),
    path('transferencia/', executa_transferencia),
]

