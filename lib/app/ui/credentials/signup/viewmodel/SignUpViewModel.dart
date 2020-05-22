import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/domain/interaction/SignUpUseCase.dart';
import 'package:solyric_app/domain/model/User.dart';
import 'package:solyric_app/app/utils/AuthStatus.dart';

class SignUpViewModel extends BaseViewModel {
  SignUpViewModel({@required SignUpUseCase useCase})
      : _useCase = useCase;

  final SignUpUseCase _useCase;

  Future<AuthStatus> signUp(User user) async{
    setLoading(true);
    AuthStatus _authStates = await _useCase.signUp(user);
    setLoading(false);
    return _authStates;
  }

  Future<AuthStatus> createUsername(String username, String uid) async{
    setLoading(true);
    AuthStatus _authStates = await _useCase.createUsername(username, uid);
    setLoading(false);
    return _authStates;
  }

  Future<AuthStatus> isExistUsername(String username) async{
    setLoading(true);
    AuthStatus _authStates = await _useCase.isExistUsername(username);
    setLoading(false);
    return _authStates;
  }
}