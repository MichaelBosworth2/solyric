import 'package:solyric_app/domain/model/User.dart';
import 'package:solyric_app/domain/repository/AuthRepository.dart';

class LoginUseCase {
  LoginUseCase({AuthRepository repo}) : _repo = repo;
  final AuthRepository _repo;

  Future<bool> login(User user) async => _repo.login(user);
}
