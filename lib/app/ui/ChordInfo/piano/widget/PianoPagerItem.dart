import 'dart:ui';

import 'package:flutter/material.dart';

class PianoPagerItem extends StatelessWidget {
  const PianoPagerItem({this.resource, this.name});

  final String resource;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 35, top: 20, right: 10, left: 10),
      child: Container(
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(resource), fit: BoxFit.contain)),
                ),
              ),
            )),
      ),
    );
  }
}
