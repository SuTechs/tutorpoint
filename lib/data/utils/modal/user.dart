import 'package:flutter/foundation.dart';
import 'dataBox.dart';

class User extends ChangeNotifier {
  static final User _singleton = User._internal();

  factory User() {
    return _singleton;
  }

  User._internal();

  String _userId;
  String _email;
  String _pass;

  void init() {
    _userId = Data.stringBox.get('userId');
    _pass = Data.stringBox.get('pass');
    _email = Data.stringBox.get('email');
  }

  String get email => _email;

  set email(String value) {
    _email = value;
    _updateString('email', value);
  }

  String get pass => _pass;

  set pass(String value) {
    _pass = value;
    _updateString('pass', value);
  }

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
    _updateString('userId', value);
  }

  void _updateString(String key, String value) {
    Data.stringBox.put(key, value);
    notifyListeners();
  }
}
