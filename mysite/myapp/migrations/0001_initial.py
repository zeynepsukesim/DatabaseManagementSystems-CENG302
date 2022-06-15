# Generated by Django 4.0.5 on 2022-06-15 18:40

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Country',
            fields=[
                ('cname', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('population', models.BigIntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='DiseaseType',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(max_length=140)),
            ],
        ),
        migrations.CreateModel(
            name='Users',
            fields=[
                ('email', models.CharField(max_length=60, primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=30)),
                ('surname', models.CharField(max_length=40)),
                ('salary', models.IntegerField()),
                ('phone', models.CharField(max_length=20)),
                ('cname', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.country')),
            ],
        ),
        migrations.CreateModel(
            name='Doctor',
            fields=[
                ('email', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='myapp.users')),
                ('degree', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='PublicServant',
            fields=[
                ('email', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='myapp.users')),
                ('department', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Disease',
            fields=[
                ('disease_code', models.CharField(max_length=20, primary_key=True, serialize=False)),
                ('pathogen', models.CharField(max_length=20)),
                ('description', models.CharField(max_length=140)),
                ('disease_type_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.diseasetype')),
            ],
        ),
        migrations.CreateModel(
            name='Discover',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_enc_date', models.DateField()),
                ('cname', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.country')),
                ('disease_code', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.disease')),
            ],
            options={
                'unique_together': {('cname', 'disease_code')},
            },
        ),
        migrations.CreateModel(
            name='Specialize',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('disease_type_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.diseasetype')),
                ('email', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.doctor')),
            ],
            options={
                'unique_together': {('disease_type_id', 'email')},
            },
        ),
        migrations.CreateModel(
            name='Record',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('total_deaths', models.IntegerField()),
                ('total_patients', models.IntegerField()),
                ('cname', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.country')),
                ('disease_code', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.disease')),
                ('email', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.publicservant')),
            ],
            options={
                'unique_together': {('email', 'cname', 'disease_code')},
            },
        ),
    ]
