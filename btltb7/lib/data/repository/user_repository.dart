import 'package:btltb7/data/models/user.dart';
import 'package:btltb7/data/services/user_service.dart';


class UserRepository {
  final UserService service;

  UserRepository(this.service);

  Future<List<User>> getUsers() async {
    final data = await service.fetchUsers();

    return data.map<User>((e) => User.fromJson(e)).toList();
  }

  Future<User> updateUser(String name, String email) async {
  final data = await service.updateUser(name, email);
  return User.fromJson(data);
}

}
