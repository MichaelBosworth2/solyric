import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/domain/interaction/GetProfileUseCase.dart';
import 'package:solyric_app/domain/model/ProfileUserInfo.dart';

class ProfileViewModel extends BaseViewModel {
  ProfileViewModel({@required GetProfileUseCase useCase}) : _useCase = useCase;

  final GetProfileUseCase _useCase;

  ProfileUserInfo user;

  void userName() async {
    setLoading(true);
    user = await _useCase.getUserData();
    setLoading(false);
  }
}
