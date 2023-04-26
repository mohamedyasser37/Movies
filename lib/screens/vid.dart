import 'package:flutter/material.dart';
import 'package:movies/play_movie/Results.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class Video extends StatefulWidget {
  Results results;
 Video(this.results);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {

  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller=YoutubePlayerController(

        flags: YoutubePlayerFlags(
          autoPlay: false,
          showLiveFullscreenButton: false,

        ),
        initialVideoId: '${widget.results.key}');


  }
  @override
  Widget build(BuildContext context) {
    return Container(

      child: YoutubePlayerBuilder(

        player: YoutubePlayer(controller: _controller,)
        ,builder:(context,player) {
        return YoutubePlayer(

            controller: _controller);
        } ,),
    );

  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
