import 'package:provider/provider.dart';
import 'package:solyric_app/app/ui/credentials/forgot/viewmodel/ForgotPasswordViewModel.dart';
import 'package:solyric_app/app/ui/credentials/login/viewmodel/LoginViewModel.dart';
import 'package:solyric_app/app/ui/credentials/signup/viewmodel/SignUpViewModel.dart';
import 'package:solyric_app/app/ui/post/viewmodel/NewLyricViewModel.dart';
import 'package:solyric_app/app/ui/tutorial/viewmodel/TutorialViewModel.dart';
import 'package:solyric_app/domain/interaction/GetTutorialDataUseCase.dart';
import 'package:solyric_app/app/ui/wall/viewmodel/WallViewModel.dart';
import 'package:solyric_app/domain/interaction/GetFeedUseCase.dart';
import 'package:solyric_app/data/networking/SolyricApi.dart';
import 'package:solyric_app/data/repository/AuthRepositoryImpl.dart';
import 'package:solyric_app/data/repository/LyricRepositoryImpl.dart';
import 'package:solyric_app/domain/interaction/GetChordItemUseCase.dart';
import 'package:solyric_app/domain/interaction/GetChordBoxesUseCase.dart';
import 'package:solyric_app/domain/interaction/LoginUseCase.dart';
import 'package:solyric_app/domain/interaction/ResetPasswordUseCase.dart';
import 'package:solyric_app/domain/interaction/SignUpUseCase.dart';
import 'package:solyric_app/domain/repository/AuthRepository.dart';
import 'package:solyric_app/domain/repository/LyricsRepository.dart';

class ProviderSetUp {
  static final List<SingleChildCloneableWidget> providers = [
    ...independentServices,
    ...repository,
    ...useCase,
    ...viewModel
  ];

  static List<SingleChildCloneableWidget> independentServices = [
    Provider.value(value: SolyricApi())
  ];

  static List<SingleChildCloneableWidget> repository = [
    ProxyProvider<SolyricApi, AuthRepository>(
      update: (context, api, authService) => AuthRepositoryImpl(api: api),
    ),
    ProxyProvider<SolyricApi, LyricRepository>(
      update: (context, api, authService) => LyricRepositoryImpl(api: api),
    )
  ];

  static List<SingleChildCloneableWidget> useCase = [
    ProxyProvider<AuthRepository, ResetPasswordUseCase>(
      update: (context, repo, authService) => ResetPasswordUseCase(repo: repo),
    ),
    ProxyProvider<AuthRepository, LoginUseCase>(
      update: (context, repo, authService) => LoginUseCase(repo: repo),
    ),
    ProxyProvider<AuthRepository, SignUpUseCase>(
      update: (context, repo, authService) => SignUpUseCase(repo: repo),
    ),
    ProxyProvider<LyricRepository, GetLyricChordBoxesUseCase>(
      update: (context, repo, authService) => GetLyricChordBoxesUseCase(repo: repo),
    ),
    ProxyProvider<LyricRepository, GetChordItemUseCase>(
      update: (context, repo, authService) => GetChordItemUseCase(repo: repo),
    ),
    ProxyProvider<AuthRepository, GetFeedUseCase>(
      update: (context, repo, authService) => GetFeedUseCase(repo: repo),
    ),
    ProxyProvider<AuthRepository, GetTutorialDataUseCase>(
      update: (context, repo, authService) => GetTutorialDataUseCase(repo: repo),
    )
  ];

  static List<SingleChildCloneableWidget> viewModel = [
    ProxyProvider<ResetPasswordUseCase, ForgotPasswordViewModel>(
      update: (context, useCase, authService) => ForgotPasswordViewModel(useCase: useCase),
    ),
    ProxyProvider<LoginUseCase, LoginViewModel>(
      update: (context, useCase, authService) => LoginViewModel(useCase: useCase),
    ),
    ProxyProvider<SignUpUseCase, SignUpViewModel>(
      update: (context, useCase, authService) => SignUpViewModel(useCase: useCase),
    ),
    ProxyProvider2<GetLyricChordBoxesUseCase, GetChordItemUseCase, NewLyricViewModel>(
      update: (context, chordUseCase, lineUseCase, authService) =>
          NewLyricViewModel(chordUseCase: chordUseCase, lineUseCase: lineUseCase),
    ),
    ProxyProvider<GetFeedUseCase, WallViewModel>(
      update: (context, useCase, authService) => WallViewModel(useCase: useCase),
    ),
    ProxyProvider<GetTutorialDataUseCase, TutorialViewModel>(
      update: (context, useCase, authService) => TutorialViewModel(useCase: useCase),
    ),
    
  ];
}
