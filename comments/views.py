from .forms import CommentForm
from blog.models import Article
from django.views.generic.edit import FormView
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.contrib.auth import get_user_model
from comments.models import Comment


# Create your views here.
class CommentPostView(FormView):
    form_class = CommentForm
    template_name = 'blog/articledetail.html'

    # def get(self, request, *args, **kwargs):
    #     article_id = self.kwargs['article_id']
    #     url = reverse('blog:detail',kwargs={'article_id':article_id})
    #
    #     return HttpResponseRedirect(url)

    def form_invalid(self, form):
        article_id = self.kwargs['article_id']
        article = Article.objects.get(pk=article_id)

        return self.render_to_response({
            'form':form,
            'article':article
        })

    def form_valid(self, form):
        user = self.request.user
        article_id = self.kwargs['article_id']
        article = Article.objects.get(pk=article_id)

        if not user.is_authenticated():
            email = form.cleaned_data['email']
            username = form.cleaned_data['name']

            user = get_user_model().objects.create_user(username=username,email=email,password=None)

        author_id = user.pk

        comment = form.save(False)
        comment.article = article
        comment.author = get_user_model().objects.get(pk=author_id)

        if form.cleaned_data['parent_comment_id']:
            parent_comment = Comment.objects.get(pk=form.cleaned_data['parent_comment_id'])
            comment.parent_comment = parent_comment

        comment.save(True)

        return HttpResponseRedirect("%s#div-comment-%d" % (article.get_absolute_url(), comment.pk))



