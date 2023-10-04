


import 'package:flutter/cupertino.dart';

class Providerr extends ChangeNotifier {
  List<String> fav1 = [];
  List<String> fav2 = [];
  List<String> fav3 = [];

  List<String> get img => fav1;
  List<String> get price => fav2;
  List<String> get name => fav3;

  void toggleFavorite(String img, String price, String name) {
    final isExist = fav2.contains(price);
    if (isExist) {
      fav1.remove(img);
      fav2.remove(price);
      fav3.remove(name);
    } else {
      fav1.add(img);
      fav2.add(price);
      fav3.add(name);
    }
    notifyListeners();
  }

  bool symbol(String symbols) {
    final isExist = fav3.contains(symbols);
    return isExist;
  }
}