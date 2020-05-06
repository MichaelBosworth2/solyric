import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/domain/interaction/SignUpUseCase.dart';
import 'package:solyric_app/domain/model/User.dart';

class SignUpViewModel extends BaseViewModel {
  SignUpViewModel({@required SignUpUseCase useCase})
      : _useCase = useCase;

  final SignUpUseCase _useCase;

  Future<bool> signUp(User user) => _useCase.signUp(user);
}