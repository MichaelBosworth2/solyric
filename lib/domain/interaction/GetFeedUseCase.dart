import 'package:solyric_app/domain/model/UserPosts.dart';
import 'package:solyric_app/domain/repository/FeedRepository.dart';

class GetFeedUseCase {
  GetFeedUseCase({FeedRepository repo}) : _repo = repo;
  final FeedRepository _repo;

  Future<List<UserPosts>> getAllPost() async => _repo.getAllPost();

}