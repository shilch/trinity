import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MatrixUnderlay extends StatefulWidget {
  final Widget child;

  const MatrixUnderlay({Key? key, required this.child}) : super(key: key);

  @override
  _MatrixUnderlayState createState() => _MatrixUnderlayState();
}

class _MatrixUnderlayState extends State<MatrixUnderlay> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset('assets/output.webm')
      ..initialize().then((_) async {
        if (!mounted) return;
        setState(() {});
        await _controller.setVolume(0);
        await _controller.setLooping(true);
        await _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
        Positioned.fill(child: widget.child)
      ],
    );
  }
}
