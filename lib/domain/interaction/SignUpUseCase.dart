import 'package:solyric_app/domain/model/User.dart';
import 'package:solyric_app/domain/repository/AuthRepository.dart';
import 'package:solyric_app/app/utils/AuthStatus.dart';

class SignUpUseCase {
  SignUpUseCase({AuthRepository repo}) : _repo = repo;
  final AuthRepository _repo;

  Future<AuthStatus> signUp(User user) async {
    AuthStatus _authStatus = await _repo.signUp(user);
    return _authStatus;
  }

  Future<AuthStatus> createUsername(String username, String uid) async {
    AuthStatus _authStatus = await _repo.createUsername(username, uid);
    return _authStatus;
  }

  Future<AuthStatus> isExistUsername(String username) async {
    AuthStatus _authStatus = await _repo.isExistUsername(username);
    return _authStatus;
  }
}