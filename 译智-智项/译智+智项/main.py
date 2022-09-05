import re
import html
from urllib import parse
import requests

GOOGLE_TRANSLATE_URL = 'http://translate.google.cn/m?q=%s&tl=%s&sl=%s'

def translate(text, to_language="auto", text_language="auto"):

    text = parse.quote(text)
    url = GOOGLE_TRANSLATE_URL % (text,to_language,text_language)
    response = requests.get(url)
    data = response.text
    expr = r'(?s)class="(?:t0|result-container)">(.*?)<'
    result = re.findall(expr, data)
    if (len(result) == 0):
        return ""

    return html.unescape(result[0])

print(translate("谷歌翻译", "en","zh-CN")) #汉语转英语
print(translate("你好", "ja","zh-CN")) #汉语转日语
print(translate("Google Translate", "zh-CN","en")) #英语转汉语
