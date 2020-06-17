import 'package:provider/provider.dart';
import 'package:solyric_app/app/ui/credentials/forgot/viewmodel/ForgotPasswordViewModel.dart';
import 'package:solyric_app/app/ui/credentials/login/viewmodel/LoginViewModel.dart';
import 'package:solyric_app/app/ui/credentials/signup/viewmodel/SignUpViewModel.dart';
import 'package:solyric_app/app/ui/post/viewmodel/ChordListViewModel.dart';
import 'package:solyric_app/app/ui/post/viewmodel/EditLyricViewModel.dart';
import 'package:solyric_app/app/ui/post/viewmodel/NewLyricViewModel.dart';
import 'package:solyric_app/app/ui/tutorial/viewmodel/TutorialViewModel.dart';
import 'package:solyric_app/app/ui/wall/viewmodel/WallViewModel.dart';
import 'package:solyric_app/app/ui/record/viewmodel/RecordAudioViewModel.dart';
import 'package:solyric_app/data/networking/SolyricApi.dart';
import 'package:solyric_app/data/repository/AuthRepositoryImpl.dart';
import 'package:solyric_app/data/repository/LyricRepositoryImpl.dart';
import 'package:solyric_app/data/repository/RecordAudioRepositoryImpl.dart';
import 'package:solyric_app/domain/interaction/GetChordHistoryUseCase.dart';
import 'package:solyric_app/domain/interaction/GetChordItemUseCase.dart';
import 'package:solyric_app/domain/interaction/GetChordsUseCase.dart';
import 'package:solyric_app/domain/interaction/GetFeedUseCase.dart';
import 'package:solyric_app/domain/interaction/GetTutorialDataUseCase.dart';
import 'package:solyric_app/domain/interaction/LoginUseCase.dart';
import 'package:solyric_app/domain/interaction/NewLyricUseCase.dart';
import 'package:solyric_app/domain/interaction/ResetPasswordUseCase.dart';
import 'package:solyric_app/domain/interaction/RecordAudioUseCase.dart';
import 'package:solyric_app/domain/interaction/SignUpUseCase.dart';
import 'package:solyric_app/domain/repository/AuthRepository.dart';
import 'package:solyric_app/domain/repository/LyricsRepository.dart';
import 'package:solyric_app/domain/repository/RecordAudioRepository.dart';

class ProviderModule {
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
      update: (context, api, _) => AuthRepositoryImpl(api: api),
    ),
    ProxyProvider<SolyricApi, LyricRepository>(
      update: (context, api, _) => LyricRepositoryImpl(api: api),
    ),
    ProxyProvider<SolyricApi, RecordAudioRepository>(
      update: (context, api, _) => RecordAudioRepositoryImpl(api: api),
    )
  ];

  static List<SingleChildCloneableWidget> useCase = [
    ProxyProvider<AuthRepository, ResetPasswordUseCase>(
      update: (context, repo, _) => ResetPasswordUseCase(repo: repo),
    ),
    ProxyProvider<AuthRepository, LoginUseCase>(
      update: (context, repo, _) => LoginUseCase(repo: repo),
    ),
    ProxyProvider<AuthRepository, SignUpUseCase>(
      update: (context, repo, _) => SignUpUseCase(repo: repo),
    ),
    ProxyProvider<LyricRepository, GetChordsUseCase>(
      update: (context, repo, _) => GetChordsUseCase(repo: repo),
    ),
    ProxyProvider<LyricRepository, GetChordItemUseCase>(
      update: (context, repo, _) => GetChordItemUseCase(repo: repo),
    ),
    ProxyProvider<AuthRepository, GetFeedUseCase>(
      update: (context, repo, _) => GetFeedUseCase(repo: repo),
    ),
    ProxyProvider<AuthRepository, GetTutorialDataUseCase>(
      update: (context, repo, _) => GetTutorialDataUseCase(repo: repo),
    ),
    ProxyProvider<LyricRepository, NewLyricUseCase>(
      update: (context, repo, _) => NewLyricUseCase(repo: repo),
    ),
    ProxyProvider<LyricRepository, GetChordHistoryUseCase>(
      update: (context, repo, _) => GetChordHistoryUseCase(repo: repo),
    ),
    ProxyProvider<AuthRepository, LoginUseCase>(
      update: (context, repo, _) => LoginUseCase(repo: repo),
    ),
    ProxyProvider<RecordAudioRepository, RecordAudioUseCase>(
      update: (context, repo, _) => RecordAudioUseCase(repo: repo),
    ),
  ];

  static List<SingleChildCloneableWidget> viewModel = [
    ProxyProvider<ResetPasswordUseCase, ForgotPasswordViewModel>(
      update: (context, useCase, _) =>
          ForgotPasswordViewModel(useCase: useCase),
    ),
    ProxyProvider<LoginUseCase, LoginViewModel>(
      update: (context, useCase, _) => LoginViewModel(useCase: useCase),
    ),
    ProxyProvider<SignUpUseCase, SignUpViewModel>(
      update: (context, useCase, _) => SignUpViewModel(useCase: useCase),
    ),
    ProxyProvider<GetChordItemUseCase, EditLyricViewModel>(
      update: (context, useCase, _) => EditLyricViewModel(),
    ),
    ProxyProvider2<GetChordItemUseCase, NewLyricUseCase, NewLyricViewModel>(
      update: (context, lineUseCase, createUseCase, _) => NewLyricViewModel(
          createUseCase: createUseCase, lineUseCase: lineUseCase),
    ),
    ProxyProvider2<GetChordsUseCase, GetChordHistoryUseCase,
        ChordListViewModel>(
      update: (context, chordUseCase, historyUseCase, _) => ChordListViewModel(
          chordUseCase: chordUseCase, historyUseCase: historyUseCase),
    ),
    ProxyProvider<GetFeedUseCase, WallViewModel>(
      update: (context, useCase, _) => WallViewModel(useCase: useCase),
    ),
    ProxyProvider<GetTutorialDataUseCase, TutorialViewModel>(
      update: (context, useCase, _) => TutorialViewModel(useCase: useCase),
    ),
    ProxyProvider<RecordAudioUseCase, RecordAudioViewModel>(
      update: (context, useCase, _) => RecordAudioViewModel(useCase: useCase),
    ),
  ];
}
