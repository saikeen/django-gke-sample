from django.contrib import admin

from .models import GridItem
@admin.register(GridItem)
class GridItemAdmin(admin.ModelAdmin):
    pass
