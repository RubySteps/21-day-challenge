# Day 15

Today I tried out HTML5 video players for a possible side project: I'd like to be able to stream video files stored on my NAS to my iPad. There are media centers like Kodi that enable UPnP and there are native apps that can connect to Kodi. I think there has to be a simpler way with an HTML page and an embedded video, so I tried exactly that. Turns out Matroska video doesn't work out of the box. The [MediaElement.js](http://mediaelementjs.com) player I used doesn't load the video file and I suppose it's because HTML5 doesn't support that file type. Adding `.mkv` has a mime type to the nginx web server didn't make a difference.

Soon I'll try with MP4/M4V files which should work. Maybe there is a way with converting them on-the-fly but I'd like to keep the whole setup simple. Something like [MediaCoder](http://www.mediacoderhq.com/), [ps3mediaserver](http://www.ps3mediaserver.org) or (the deprecated)[VideoLan Server](https://www.videolan.org/developers/vls.html) might work but would be overkill.

## Links

* [HTML5 Video Player Comparison](http://praegnanz.de/html5video/) 