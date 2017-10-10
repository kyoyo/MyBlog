from django.conf.urls import url,include
from django.contrib import admin
from . import views
urlpatterns = [
    url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^page/(?P<page>\d+)$', views.IndexView.as_view(), name='index_page'),
    url(r'^article/(?P<year>\d+)/(?P<month>\d+)/(?P<day>\d+)/(?P<article_id>\d+).html$',
        views.ArticleDetailView.as_view(),
        name='detail'),
    url(r'^category/(?P<category_name>\S+).html$',views.CategoryDetailView.as_view(),name='category_detail'),
]
