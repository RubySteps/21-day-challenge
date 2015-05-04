# Adventure 20_day20

Today I was working on a private project. One topic I bumped into during that was:

URL Encoding
----------
[HTML URL Encoding Reference on W3School](http://www.w3schools.com/tags/ref_urlencode.asp)
in [Ruby](Ruby.md)
```
URI.escape("#{fen_part}#{moves_part}")
```

in [JavaScript](JavaScript.md)
to encode a whole URL
```
encodeURI("http://www.google.com/a file with spaces.html")
```
to encode a URL parameter
```
encodeURIComponent('[FEN "'+ fen+ '"]'+moves);
```
http://stackoverflow.com/questions/75980/best-practice-escape-or-encodeuri-encodeuricomponent
