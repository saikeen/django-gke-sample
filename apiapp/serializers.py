from rest_framework import serializers

from .models import GridItem
class GridItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = GridItem
        # 出力したいフィールド名をタプルで(括弧とカンマ)で定義します。
        fields = ('id', 'product', 'date', 'amount')
