import 'package:flutter/material.dart';
import 'package:music_player/themes/dark_mode.dart';
import 'package:music_player/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier{

  bool isDarkMode = false;

  ThemeData get currentTheme => isDarkMode ? darkMode : lightMode;

  void toggleTheme() {

    isDarkMode = !isDarkMode;
    notifyListeners();
  } 



}