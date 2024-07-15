import 'package:flutter/material.dart';

class SequentialTextFade extends StatefulWidget {
  final List<String> sequentialTextsList;
  final Duration duration;
  final Duration delay;
  final Alignment textAlignment;
  final TextStyle? textStyle;

  const SequentialTextFade({
    super.key,
    required this.sequentialTextsList,
    this.duration = const Duration(seconds: 2),
    this.delay = const Duration(seconds: 2),
    this.textAlignment = Alignment.center,
    this.textStyle,
  });

  @override
  SequentialTextFadeState createState() => SequentialTextFadeState();
}

class SequentialTextFadeState extends State<SequentialTextFade> {
  List<double> opacities = [1.0];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    opacities = List<double>.generate(
        widget.sequentialTextsList.length, (index) => index == 0 ? 1.0 : 0.0);
    _startAnimation();
  }

  Future<void> _startAnimation() async {
    for (int i = 0; i < widget.sequentialTextsList.length - 1; i++) {
      await Future.delayed(widget.delay);

      setState(() {
        opacities[i] = 0.0;
        opacities[i + 1] = 1.0;
      });
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
            style: widget.textStyle ?? const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

