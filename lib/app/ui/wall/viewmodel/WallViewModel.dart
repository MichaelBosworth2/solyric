import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/domain/interaction/GetFeedUseCase.dart';

class WallViewModel extends BaseViewModel {
  WallViewModel({@required GetFeedUseCase useCase})
  : _useCase = useCase;

  final GetFeedUseCase _useCase;
}
