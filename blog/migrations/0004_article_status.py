# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-09-27 06:54
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0003_article_pub_time'),
    ]

    operations = [
        migrations.AddField(
            model_name='article',
            name='status',
            field=models.CharField(choices=[('d', '草稿'), ('p', '发表')], default='p', max_length=1, verbose_name='文章状态'),
        ),
    ]
