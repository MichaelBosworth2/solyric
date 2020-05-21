import 'package:solyric_app/domain/repository/AuthRepository.dart';

class GetTutorialDataUseCase {
   GetTutorialDataUseCase({AuthRepository repo}) : _repo = repo;
  final AuthRepository _repo;
}