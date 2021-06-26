from django.db import models

class GridItem(models.Model):
    product = models.CharField(max_length=128)
    date = models.DateField()
    amount = models.IntegerField()
