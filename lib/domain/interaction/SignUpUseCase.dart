import 'package:solyric_app/domain/model/User.dart';
import 'package:solyric_app/domain/repository/AuthRepository.dart';

class SignUpUseCase {
  SignUpUseCase({AuthRepository repo}) : _repo = repo;
  final AuthRepository _repo;

  Future<bool> signUp(User user) async =>
      _repo.signUp(user);
}