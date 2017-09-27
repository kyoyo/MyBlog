from django.shortcuts import render
from django.http import HttpResponse
from django.views import generic
from .models import Article

# Create your views here.

# def index(request):
#     return HttpResponse("hello,kyo")


class IndexView(generic.ListView):
    template_name = 'blog/index.html'
    context_object_name = 'article_list'

    def get_queryset(self):
        article_list = Article.objects.all()
        return article_list