import 'package:digital_map/views/login/signin%20folder/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class lottieAnimation extends StatefulWidget {
  const lottieAnimation({super.key});

  @override
  State<lottieAnimation> createState() => _lottieAnimationState();
}

class _lottieAnimationState extends State<lottieAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isloading = false;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isloading = true;
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _isloading
          ? loginpage()
          : Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Lottie.asset("asset/splash.json",
                    controller: _controller, onLoaded: (camp) {
                  _controller.duration = camp.duration;
                  _controller.forward();
                }),
              ),
            ),
    );
  }
}
