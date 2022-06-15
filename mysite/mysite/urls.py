"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from myapp.views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    path('index/', index),
    path('q1/', q1),
    path('q2/', q2),
    path('q3/', q3),
    path('q4/', q4),
    path('q5/', q5),
    path('q6/', q6),
    path('q7/', q7),
    path('q8/', q8),
    path('q9/', q9),
    path('q10/', q10),
    path('q11/', q11),

]
