
import 'package:solyric_app/domain/repository/ProfileRepository.dart';
import 'package:solyric_app/data/networking/SolyricApi.dart';

class ProfileRepositoryImpl implements ProfileRepository{

  ProfileRepositoryImpl({SolyricApi api}): _api = api;
  final SolyricApi _api;

  @override
  Future<String> getProfileData() async{
    return _api.getProfile();
  }

}