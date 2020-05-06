import 'package:solyric_app/domain/model/User.dart';

class AuthRepository {
  Future<bool> login(User user) {
    throw Exception("Unimplemented exception");
  }

  Future<bool> resetPassword(String email) async {
    throw Exception("Unimplemented exception");
  }

  Future<bool> signUp(User user) async {
    throw Exception("Unimplemented exception");
  }
}