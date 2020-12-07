import 'package:solyric_app/domain/model/ProfileUserInfo.dart';
import 'package:solyric_app/domain/repository/ProfileRepository.dart';

class GetProfileUseCase {
  GetProfileUseCase({ProfileRepository repo}) : _repo = repo;
  final ProfileRepository _repo;

  Future<ProfileUserInfo> getUserData() async => _repo.getProfileData();
}
