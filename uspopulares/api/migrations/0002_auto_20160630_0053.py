# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-06-30 00:53
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='publicacao',
            name='banca',
            field=models.TextField(default=''),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='publicacao',
            name='downlaods',
            field=models.IntegerField(default=0),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='publicacao',
            name='visitas',
            field=models.IntegerField(default=0),
            preserve_default=False,
        ),
    ]
