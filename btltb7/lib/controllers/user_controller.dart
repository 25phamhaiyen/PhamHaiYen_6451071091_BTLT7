import 'package:btltb7/data/models/user.dart';
import 'package:btltb7/data/repository/user_repository.dart';


class UserController {
  final UserRepository repo;

  UserController(this.repo);

  Future<List<User>> fetchUsers() {
    return repo.getUsers();
  }
}
