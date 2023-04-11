import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class MyHomePage extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: init(),
      ),
    );
  }
}


init()async{

  final videoPlayerController = VideoPlayerController.asset('assets/nature.mp4');

  await videoPlayerController.initialize();

  final chewieController = ChewieController(
    optionsBuilder: (context, defaultOptions) async {
      await showDialog<void>(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: ListView.builder(
              itemCount: defaultOptions.length,
              itemBuilder: (_, i) => ActionChip(
                label: Text(defaultOptions[i].title),
                onPressed: () =>
                    defaultOptions[i].onTap!(),
              ),
            ),
          );
        },
      );
    },
    videoPlayerController: videoPlayerController,
    autoPlay: true,
    looping: true,
  );

  final playerWidget = Chewie(
    controller: chewieController,
  );

  return playerWidget;

}