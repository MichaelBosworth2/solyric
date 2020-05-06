import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/domain/interaction/ResetPasswordUseCase.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  ForgotPasswordViewModel({@required ResetPasswordUseCase useCase})
      : _useCase = useCase;

  final ResetPasswordUseCase _useCase;

  Future<bool> forgotPassword(String email) async {
    setLoading(true);
    bool response = await _useCase.resetPassword(email);
    setLoading(false);
    return response;
  }
}
