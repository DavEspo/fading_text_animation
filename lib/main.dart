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

class _FadingTextAnimationState extends State<FadingTextAnimation> with SingleTickerProviderStateMixin{
  bool _isVisible = true;
  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;
  

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    //   // controller=AnimationController(vsync: this, duration: Duration(seconds: 1));
    //   // super.initState();
    // controller=AnimationController(vsync: this, duration: Duration(seconds: 2));
    // colorAnimation=ColorTween(begin: Colors.green, end: Colors.red).animate(controller);
    // sizeAnimation=Tween<double>(begin: 100, end: 200).animate(controller);
    // controller.addListener(() {
    //   setState(() {});
    // },);
    // controller.repeat();
    });
  }

  @override
  void initState() {
    // super.initState();
    controller=AnimationController(vsync: this, duration: Duration(seconds: 2));
    colorAnimation=ColorTween(begin: Colors.green, end: Colors.red).animate(controller);
    sizeAnimation=Tween<double>(begin: 100, end: 200).animate(controller);
    controller.addListener(() {
      setState(() {});
    },);
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fading Text Animation'),
      ),
      body: Center(
        // child: Container(

        // ),
        child: Column(
          children: [
            Container(
              height: sizeAnimation.value,
              width: sizeAnimation.value,
              color: colorAnimation.value,
              // onTap
            ),
            // GestureDetector(onTap: initState(),
            // child: ColorTween(begin: Colors.green, end: Colors.red).animate(controller),),
          GestureDetector(
          onTap: toggleVisibility,
          child: AnimatedOpacity(
            opacity: _isVisible ? 1.0 : 0.0,
            duration: Duration(seconds: 1),
            child: const Text(
              'Hello, Flutter!',
              style: TextStyle(fontSize: 24),
              
            ),
            curve: Curves.easeInOut
            
          ),
        )]
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}