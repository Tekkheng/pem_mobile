import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/user.dart';

class UserNotifier extends StateNotifier<Map<String, UserModel>> {
  UserNotifier() : super({});

  void addUser(UserModel newDat) {
    state = {'user': newDat};
  }
}

final userProvider =
    StateNotifierProvider<UserNotifier, Map<String, UserModel>>(
  (ref) => UserNotifier(),
);
