import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/ui/wall/viewmodel/WallViewModel.dart';
import 'package:solyric_app/app/ui/wall/widget/WallCard.dart';

class WallScreen extends StatefulWidget {
  @override
  _WallScreenState createState() => _WallScreenState();
}

class _WallScreenState extends State<WallScreen>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('scroll end');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<WallViewModel>(
        onModelReady: (controller, model) => model.getData(),
        builder: (context, model, child) => Scaffold(
            body: model.isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: model.listUserPost.length,
                    itemBuilder: (ctx, i) => Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: WallCard(
                            title: model.listUserPost[i].title,
                            description: model.listUserPost[i].description,
                            attachment: model.listUserPost[i].attachment,
                          ),
                        ))));
  }
}
