import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/domain/interaction/GetProfileUseCase.dart';
import 'package:solyric_app/domain/model/ProfileUserInfo.dart';
import 'package:solyric_app/domain/model/UserPosts.dart';

class ProfileViewModel extends BaseViewModel {
  ProfileViewModel({@required GetProfileUseCase useCase}) : _useCase = useCase;

  final GetProfileUseCase _useCase;

  ProfileUserInfo user;
  List<UserPosts> userPosts;

  void userName() async {
    setLoading(true);
    user = await _useCase.getUserData();
    setLoading(false);
  }

  void getUserPosts() async {
    setLoading(true);
    userPosts = await _useCase.getUserPosts();
    setLoading(false);
  }
}
