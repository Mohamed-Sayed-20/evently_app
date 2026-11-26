import 'package:flutter/material.dart';

import '../model/my_user.dart';

class UserProvider extends ChangeNotifier {
  //todo: 1- data - 2- Function
  MyUser? user;

  void updateUser(MyUser newUser) {
    user = newUser;
    notifyListeners();
  }
}
