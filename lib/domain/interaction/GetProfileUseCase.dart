
import 'package:solyric_app/domain/repository/ProfileRepository.dart';

class GetProfileUseCase{
  GetProfileUseCase({ProfileRepository repo }) : _repo = repo;
  final ProfileRepository _repo ;

  Future<String> getUserData( ) async => _repo.getProfileData();

}