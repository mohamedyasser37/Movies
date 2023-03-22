import 'package:flutter/material.dart';
import 'package:movies/play_movie/Results.dart';
import 'package:video_player/video_player.dart';
class Video extends StatefulWidget {
  Results results;
 Video(this.results);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    print('${widget.results.key}');

    super.initState();

    _controller =

    VideoPlayerController.network(
       //  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
'https://youtube.com/watch?v=${widget.results.key}'
   // 'assets/images/flutter_lints (Package of the Week).mp4'
    )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    //late VideoPlayerController _controller;
    return Column(
      children: [
      Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
                : Container(width: double.infinity,),
          ),
           FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
      ],
    );
    //    Scaffold(
    //     appBar: AppBar(leading: InkWell(
    //         onTap: (){
    //           Navigator.pop(context);
    //         },
    //         child: Icon(Icons.arrow_back_rounded,)),
    //       centerTitle: true,
    //       backgroundColor: Color.fromARGB(255, 29, 30, 29),
    //       title: Text('Movie',style: TextStyle(color: Colors.amber),),
    //     ),
    //     body: Center(
    //       child: _controller.value.isInitialized
    //           ? AspectRatio(
    //         aspectRatio: _controller.value.aspectRatio,
    //         child: VideoPlayer(_controller),
    //       )
    //           : Container(width: double.infinity,),
    //     ),
    //     floatingActionButton: FloatingActionButton(
    //       onPressed: () {
    //         setState(() {
    //           _controller.value.isPlaying
    //               ? _controller.pause()
    //               : _controller.play();
    //         });
    //       },
    //       child: Icon(
    //         _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
    //       ),
    //     ),
    //
    // );
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
