import 'package:provider/provider.dart';
import 'package:solyric_app/core/model/User.dart';
import 'package:solyric_app/core/services/Api.dart';
import 'package:solyric_app/core/services/AuthService.dart';

class ProviderSetUp {
  static final List<SingleChildCloneableWidget> providers = [
    ...independentServices,
    ...dependentServices,
    ...viewModels
  ];

  static List<SingleChildCloneableWidget> independentServices = [
    Provider.value(value: Api())
  ];

  static List<SingleChildCloneableWidget> dependentServices = [
    ProxyProvider<Api, AuthenticationService>(
      update: (context, api, authService) => AuthenticationService(api: api),
    )
  ];

  static List<SingleChildCloneableWidget> viewModels = [
    StreamProvider<User>(
      create: (context) =>
          Provider.of<AuthenticationService>(context, listen: false).user,
    )
  ];
}
