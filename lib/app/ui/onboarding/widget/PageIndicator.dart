import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final bool isCurrentPage;
  const PageIndicator({Key key, this.isCurrentPage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isCurrentPage ? 20.0 : 8.0,
      width: isCurrentPage ? 20.0 : 8.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.white : Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
