import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class shared with ChangeNotifier {
  late SharedPreferences login;

  void initial() async {
    login = await SharedPreferences.getInstance();
  }

  void set(bool b) {
    login.setBool("key", b);
    notifyListeners();
  }
}
