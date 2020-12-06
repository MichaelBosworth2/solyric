import 'package:flutter/material.dart';

class OnBoardingFirstStep extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  final String background;

  const OnBoardingFirstStep(
      {Key key, this.image, this.title, this.text, this.background})
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 22,
          ),
          Image.asset(
            image,
            width: MediaQuery.of(context).size.width / 2.5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 11,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 8.5),
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
