import 'dart:ui';

import 'package:flutter/material.dart';

class GuitarPagerItem extends StatelessWidget {
  const GuitarPagerItem({this.resource, this.name});

  final String resource;
  final String name;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(bottom: 35, top: 30, left: 30, right: 30),
        child: Container(
          constraints: BoxConstraints.expand(),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(resource),
                          fit: BoxFit.contain)),
                ),
              )),
        ),
      );
}
