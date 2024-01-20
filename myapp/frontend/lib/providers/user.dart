import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/screens/model/user.dart';

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier() : super({} as UserModel);

  void addUser(UserModel newDat) {
    state = newDat;
  }
}

final userProvider =
    StateNotifierProvider<UserNotifier, UserModel>(
        (ref) => UserNotifier());
