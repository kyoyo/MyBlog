from django import template


register = template.Library()



@register.inclusion_tag('comments/tags/comment_item.html')
def show_comment_item(comment,ischild):
    depth = 1 if ischild else 2
    return {
        'comment_item':comment,
        'depth':depth
    }

@register.assignment_tag
def parse_commenttree(commentlist,comment):
    datas = []

    def parse(c):
        childs = commentlist.filter(parent_comment=c)

        for child in childs:
            datas.append(child)
            parse(child)

    parse(comment)

    return datas