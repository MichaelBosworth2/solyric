import 'package:solyric_app/domain/model/ProfileUserInfo.dart';
import 'package:solyric_app/domain/model/UserPosts.dart';
import 'package:solyric_app/domain/repository/ProfileRepository.dart';
import 'package:solyric_app/data/networking/SolyricApi.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({SolyricApi api}) : _api = api;
  final SolyricApi _api;

  @override
  Future<ProfileUserInfo> getProfileData() async {
    return _api.getProfile();
  }

  @override
  Future<List<UserPosts>> getUserPosts() {
    return _api.getUserPosts();
  }
}
