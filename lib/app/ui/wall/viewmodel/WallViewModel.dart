import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/domain/interaction/GetFeedUseCase.dart';
import 'package:solyric_app/domain/model/UserPosts.dart';

class WallViewModel extends BaseViewModel {
  WallViewModel({@required GetFeedUseCase useCase}) : _useCase = useCase;

  final GetFeedUseCase _useCase;

  List<UserPosts> listUserPost;

  void getData() async {
    setLoading(true);
    listUserPost = await _useCase.getAllPost();
    setLoading(false);
  }
}
