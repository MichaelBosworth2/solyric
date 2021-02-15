import 'package:solyric_app/domain/model/UserPosts.dart';
import 'package:solyric_app/domain/repository/ProfileRepository.dart';

class GetUserPostsUseCase {
  GetUserPostsUseCase({ProfileRepository repo}) : _repo = repo;
  final ProfileRepository _repo;

  Future<List<UserPosts>> getUserPosts() async => _repo.getUserPosts();
}
