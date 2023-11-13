import 'package:calaton_project_2/app/service/local_storage.dart';
import 'package:calaton_project_2/data/repositories/user_repository.dart';

class LoginFactory {
  final LocalStorage localStorage;
  final UserRepository userRepository;

  LoginFactory(this.localStorage, this.userRepository);
}
