
import 'package:solyric_app/data/networking/SolyricApi.dart';
import 'package:solyric_app/domain/model/UserPosts.dart';
import 'package:solyric_app/domain/repository/FeedRepository.dart';

class FeedRepositoryImpl implements FeedRepository{
  FeedRepositoryImpl({SolyricApi api}) : _api = api ;
  final SolyricApi _api;

  @override
  Future<List<UserPosts>> getAllPost() {
    return _api.getAllPosts();
  }

}