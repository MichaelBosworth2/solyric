import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/domain/interaction/GetProfileUseCase.dart';

class ProfileViewModel extends BaseViewModel {
  ProfileViewModel({@required GetProfileUseCase useCase}) : _useCase = useCase;

  final GetProfileUseCase _useCase;

  String user;

  void userName() async {
    setLoading(true);
    user = await _useCase.getUserData();
    setLoading(false);
  }
}
