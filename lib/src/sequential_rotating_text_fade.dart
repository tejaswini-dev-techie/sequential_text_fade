import 'package:flutter/material.dart';

class SequentialRotatingTextFade extends StatefulWidget {
  final List<String> sequentialTextsList;
  final Duration duration;
  final Duration delay;
  final Alignment textAlignment;
  final TextStyle? textStyle;

  const SequentialRotatingTextFade({
    super.key,
    required this.sequentialTextsList,
    this.duration = const Duration(seconds: 2),
    this.delay = const Duration(seconds: 2),
    this.textAlignment = Alignment.center,
    this.textStyle,
  });

  @override
  SequentialRotatingTextFadeState createState() =>
      SequentialRotatingTextFadeState();
}

class SequentialRotatingTextFadeState
    extends State<SequentialRotatingTextFade> {
  late List<double> opacities;

  @override
  void initState() {
    super.initState();
    opacities = List<double>.filled(widget.sequentialTextsList.length, 0.0);
    _startAnimation();
  }

  Future<void> _startAnimation() async {
    while (true) {
      for (int i = 0; i <= widget.sequentialTextsList.length; i++) {
        if (i != 0) {
          await Future.delayed(widget.delay);
        }
        setState(() {
          opacities = List<double>.generate(widget.sequentialTextsList.length,
              (index) => index == i ? 1.0 : 0.0);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: widget.textAlignment,
      children: List.generate(
        widget.sequentialTextsList.length,
        (index) => AnimatedOpacity(
          opacity: opacities[index],
          duration: widget.duration,
          curve: Curves.easeInOut,
          child: Text(
            widget.sequentialTextsList[index],
            style: widget.textStyle ??
                const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
