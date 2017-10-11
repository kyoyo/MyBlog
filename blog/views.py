from django.shortcuts import render
from django.http import HttpResponse
#from django.views.generic.list import ListView
#from django.views.generic.detail import DetailView
from django.views.generic import ListView,DetailView
from .models import Article
from django.conf import settings
from django.core.exceptions import ObjectDoesNotExist
from comments.forms import CommentForm
from django import forms
# Create your views here.

# def index(request):
#     return HttpResponse("hello,kyo")


class ArticleListView(ListView):
    template_name = 'blog/index.html'
    context_object_name = 'article_list'

    page_type = ''
    paginate_by = settings.PAGINATE_BY
    page_kwarg = 'page'


class IndexView(ArticleListView):

    def get_queryset(self):
        article_list = Article.objects.all()
        return article_list


class ArticleDetailView(DetailView):
    template_name = 'blog/articledetail.html'
    model = Article
    pk_url_kwarg = 'article_id'
    context_object_name = 'article'

    def get_object(self):
        obj = super(ArticleDetailView,self).get_object()
        obj.viewed()


        return obj

    def get_context_data(self, **kwargs):
        articleid = int(self.kwargs[self.pk_url_kwarg])

        def get_article(id):
            try:
                return Article.objects.get(pk=id)
            except ObjectDoesNotExist:
                return None


        comment_form = CommentForm()

        if self.request.user.is_authenticated:
            comment_form.fields.update(
                {
                    'email':forms.CharField(widget=forms.HiddenInput()),
                    'name':forms.CharField(widget=forms.HiddenInput()),
                }
            )
            user = self.request.user
            comment_form.fields['email'].initial = user.email
            comment_form.fields['name'].initial = user.username

        article_comments = self.object.comment_set.all()

        kwargs['form'] = comment_form
        kwargs['article_comments'] = article_comments
        kwargs['comment_count'] = len(article_comments) if article_comments else 0

        next_article = get_article(articleid + 1)
        prev_article = get_article(articleid - 1)

        kwargs['next_article'] = next_article
        kwargs['prev_article'] = prev_article


        return super(ArticleDetailView,self).get_context_data(**kwargs)



class CategoryDetailView(ArticleListView):

    def get_queryset(self):
        categoryname = self.kwargs['category_name']

        try:
           categoryname = categoryname.split('/')[-1]
        except:
            pass

        article_list = Article.objects.filter(category__name=categoryname)

        return article_list