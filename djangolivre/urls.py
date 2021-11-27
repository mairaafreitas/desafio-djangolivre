from conta.views import ContaViewSet
from usuario.views import UsuarioViewSet
from django.urls import path, include
from rest_framework.routers import DefaultRouter

router = DefaultRouter()

router.register(r'conta', ContaViewSet)
router.register(r'usuario', UsuarioViewSet)

urlpatterns = [
path('', include(router.urls))
]

