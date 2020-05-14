import 'package:solyric_app/domain/repository/AuthRepository.dart';

class GetFeedUseCase {
  GetFeedUseCase({AuthRepository repo}) : _repo = repo;
  final AuthRepository _repo;
}