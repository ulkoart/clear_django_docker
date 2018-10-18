from django.http import HttpResponse
from django.contrib import admin
from django.urls import path

def index(request):
    return HttpResponse("Django + Docker = ❤")

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', index, name='index')
]
