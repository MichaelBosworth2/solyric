import 'package:flutter/material.dart';

class OnBoardingStep extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  final String background;
  final double bottom;
  final double width;
  final double right;
  final double left;
  final double top;

  const OnBoardingStep(
      {Key key,
      this.image,
      this.title,
      this.text,
      this.background,
      this.bottom,
      this.width,
      this.right,
      this.left,
      this.top})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black87,
          image: DecorationImage(
              image: AssetImage(background),
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          Positioned(
            width: width,
            bottom: bottom,
            left: left,
            right: right,
            top: top,
            child: Image.asset(
              image,
            ),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 8.5),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 22,
                    ),
                    Text(
                      text,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
