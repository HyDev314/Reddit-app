import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class AppColor {
  // Colors
  static const blackColor = Color.fromRGBO(1, 1, 1, 1);
  static const greyColor = Color.fromRGBO(26, 39, 45, 1);
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const whiteColor = Colors.white;
  static var redColor = Colors.red.shade500;
  static var blueColor = Colors.blue.shade300;

  // Themes
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: blackColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: drawerColor,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: drawerColor,
    ),
    primaryColor: redColor,
    backgroundColor: drawerColor,
  );

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: whiteColor,
    ),
    primaryColor: redColor,
    backgroundColor: whiteColor,
  );
}

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeMode _mode;
  ThemeNotifier({ThemeMode mode = ThemeMode.dark})
      : _mode = mode,
        super(
          AppColor.darkModeAppTheme,
        ) {
    getTheme();
  }

  ThemeMode get mode => _mode; 

  void getTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final theme = pref.getString('theme');

    if (theme == 'light') {
      _mode = ThemeMode.light;
      state = AppColor.lightModeAppTheme;
    } else {
      _mode = ThemeMode.dark;
      state = AppColor.darkModeAppTheme;
    }
  }

  void toggleTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (_mode == ThemeMode.dark) {
      _mode = ThemeMode.light;
      state = AppColor.lightModeAppTheme;
      pref.setString('theme', 'light');
    } else {
      _mode = ThemeMode.dark;
      state = AppColor.darkModeAppTheme;
      pref.setString('theme', 'dark');
    }
  }
}
