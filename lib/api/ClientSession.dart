import 'package:flutter/foundation.dart';

import 'api.dart';
class ClientSession extends ChangeNotifier {
  String? _accessToken;
  List<Menuitem>? _menuItems;

  String? get accessToken => _accessToken;
  // Add a new MenuItem to the _menuItems list and notify listeners
  void addMenuItem(Menuitem menuItem) {
    if (_menuItems == null) {
      _menuItems = [];
    }
    _menuItems!.add(menuItem);
    notifyListeners();
  }
  set accessToken(String? value) {
    _accessToken = value;
    notifyListeners();
  }

  List<Menuitem>? get menuItems => _menuItems;

  set menuItems(List<Menuitem>? value) {
    _menuItems = value;
    notifyListeners();
  }

  bool get isAuthenticated => _accessToken != null;
}