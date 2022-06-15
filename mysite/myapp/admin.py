from django.contrib import admin
from .models import *
# Register your models here.
admin.site.register(Users)
admin.site.register(DiseaseType)
admin.site.register(Disease)
admin.site.register(Discover)
admin.site.register(Doctor)
admin.site.register(PublicServant)
admin.site.register(Record)
admin.site.register(Country)
admin.site.register(Specialize)