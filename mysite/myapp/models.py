from django.db import models

# Create your models here.
class DiseaseType(models.Model):
    description = models.CharField(max_length=140)


class Country(models.Model):
    cname = models.CharField(max_length=50, primary_key=True)
    population = models.BigIntegerField()


class Disease(models.Model):
    disease_code = models.CharField(max_length=20, primary_key=True)
    pathogen = models.CharField(max_length=20)
    description = models.CharField(max_length=140)
    disease_type_id = models.ForeignKey(DiseaseType, on_delete=models.CASCADE)


class Discover(models.Model):
    class Meta:
        unique_together = (("cname", "disease_code"),)
    first_enc_date = models.DateField()
    cname = models.ForeignKey(Country, on_delete=models.CASCADE)
    disease_code = models.ForeignKey(Disease, on_delete=models.CASCADE)


class Users(models.Model):
    email = models.CharField(max_length=60, primary_key=True)
    name = models.CharField(max_length=30)
    surname = models.CharField(max_length=40)
    salary = models.IntegerField()
    phone = models.CharField(max_length=20)
    cname = models.ForeignKey(Country, on_delete=models.CASCADE)


class PublicServant(models.Model):
    email = models.ForeignKey(Users, primary_key=True, on_delete=models.CASCADE)
    department = models.CharField(max_length=50)


class Doctor(models.Model):
    email = models.ForeignKey(Users, primary_key=True, on_delete=models.CASCADE)
    degree = models.CharField(max_length=20)


class Specialize(models.Model):
    class Meta:
        unique_together = (("disease_type_id", "email"),)
    disease_type_id = models.ForeignKey(DiseaseType, on_delete=models.CASCADE)
    email = models.ForeignKey(Doctor, on_delete=models.CASCADE)


class Record(models.Model):
    class Meta:
        unique_together = (("email", "cname", "disease_code"),)
    email = models.ForeignKey(PublicServant, on_delete=models.CASCADE)
    cname = models.ForeignKey(Country, on_delete=models.CASCADE)
    disease_code = models.ForeignKey(Disease, on_delete=models.CASCADE)
    total_deaths = models.IntegerField()
    total_patients = models.IntegerField()




