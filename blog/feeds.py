from django.contrib.syndication.views import Feed
from django.urls import reverse_lazy

from .models import Post


class LatestPostFeed(Feed):
    content_type = "text/xml"
    title = "Latest posts"
    link = "/rss/"
    description = "Latest blog posts"
    stylesheet = reverse_lazy("stylesheet")

    def items(self):
        return Post.objects.order_by("-published")[:10]

    def item_title(self, item):
        return item.title

    def item_description(self, item):
        return item.body

    def item_pubdate(self, item):
        return item.published

    def get_feed(self, obj, request):
        feed = super().get_feed(obj, request)
        feed.content_type = "text/xml; charset=utf-8"
        return feed

