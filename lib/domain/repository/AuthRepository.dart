import 'package:solyric_app/domain/model/User.dart';
import 'package:solyric_app/app/utils/AuthStatus.dart';

class AuthRepository {
  Future<bool> login(User user) {
    throw Exception("Unimplemented exception");
  }

  Future<bool> resetPassword(String email) async {
    throw Exception("Unimplemented exception");
  }

  Future<AuthStatus> signUp(User user) async {
    throw Exception("Unimplemented exception");
  }

  Future<AuthStatus> createUsername(String username, String uid) async {
    throw Exception("Unimplemented exception");
  }

  Future<AuthStatus> isExistUsername(String username) async {
    throw Exception("Unimplemented exception");
  }
}