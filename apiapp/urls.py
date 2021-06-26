from rest_framework import routers
from .views import GridItemViewSet
router = routers.DefaultRouter()
#rを文字列の前に付与してエスケープシーケンスを無効化し、そのままの文字として扱う
router.register(r'griditem', GridItemViewSet)
