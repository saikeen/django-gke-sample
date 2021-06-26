from django.shortcuts import render

from rest_framework import viewsets

from .models import GridItem
from .serializers import GridItemSerializer
class GridItemViewSet(viewsets.ModelViewSet):
    queryset = GridItem.objects.all()
    serializer_class = GridItemSerializer
