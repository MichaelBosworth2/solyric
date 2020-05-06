import 'package:solyric_app/domain/repository/AuthRepository.dart';

class ResetPasswordUseCase {
  ResetPasswordUseCase({AuthRepository repo}) : _repo = repo;
  final AuthRepository _repo;

  Future<bool> resetPassword(String email) async =>
      _repo.resetPassword(email);
}
