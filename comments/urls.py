from django.conf.urls import url
from .views import CommentPostView

urlpatterns = [
    url('^article/(?P<article_id>\d+)/postcomment$',CommentPostView.as_view(),name='postcomment'),
]