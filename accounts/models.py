from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.



class BlogUser(AbstractUser):
    nickname = models.CharField('昵称',max_length=50,blank=True)
    mugshot = models.ImageField('头像',upload_to='upload/mugshots',blank=True)

    def __str__(self):
        return self.username

    class Meta:
        verbose_name ='用户'
        verbose_name_plural = verbose_name