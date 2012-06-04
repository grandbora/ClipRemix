[ClipRemix](http://clipremix.herokuapp.com/)
=========

### Playlist generator for [movieclips.com](http://movieclips.com/)
Generate your playlist and mashups (soon to be added) from the clips provided on movieclips.com  
Live at [http://clipremix.herokuapp.com/](http://clipremix.herokuapp.com/)

This app is built during [moviehackday 2012](http://www.moviehackday.com/)  ([photo](http://twitpic.com/9se8q2) and [another](http://twitpic.com/9se7ub))  
The source code has a lot of bad programming practices and antipatterns (due to time constraints),  
I hope to clean it up sometime in near future.

##### to whom it may concern :
  server  : ruby + sinatra + redis  
  client  : [chaplin](https://github.com/chaplinjs/chaplin) (backbone + undescore) + jquery[UI] + [swfobject](http://github.com/swfobject/swfobject)  
  api : application relies on [jsonclips api](https://github.com/jayniz/jsonclips) which proxies [movieclips api](http://api.movieclips.com/) and converts data from xml to json
