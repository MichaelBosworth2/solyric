import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/domain/interaction/LoginUseCase.dart';
import 'package:solyric_app/domain/model/User.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel({@required LoginUseCase useCase})
      : _useCase = useCase;

  final LoginUseCase _useCase;

  Future<bool> login(User user) => _useCase.login(user);
}
