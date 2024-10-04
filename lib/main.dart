import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FadingTextAnimation(),
    );
  }
}

class FadingTextAnimation extends StatefulWidget {
  @override
  _FadingTextAnimationState createState() => _FadingTextAnimationState();
}

class _FadingTextAnimationState extends State<FadingTextAnimation> with TickerProviderStateMixin{
  bool _isVisible = true;
  late AnimationController _animationController;
  
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1)
    );
  }

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1)
    );
    _animationController.forward();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fading Text Animation'),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                toggleVisibility;
              },
              child: RotationTransition(
                turns: _animationController,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  curve: _isVisible == true ? Curves.easeInCirc:Curves.easeOutSine,
                  duration: Duration(seconds: 1),
                  height: _isVisible == true ? 300:0,
                  width: _isVisible == true ? 300:0,
                  color: _isVisible == true ? Colors.blue: Colors.white,
                ),
              )
            ),
            GestureDetector(
              onTap: toggleVisibility,
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: const Text(
                  'Hello, Flutter!',
                  style: TextStyle(fontSize: 24),
                )
              ),
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}