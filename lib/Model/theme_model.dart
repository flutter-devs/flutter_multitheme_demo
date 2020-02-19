import 'package:flutter/material.dart';


enum ThemeType { Dark, Light }

class ThemeModel extends ChangeNotifier {
  ColorSwatch _tempPrimaryMainColor;
  ColorSwatch _tempAccentColor;
  ColorSwatch _tempScaffoldColor;
  ColorSwatch _tempTextColor;
  ColorSwatch _tempAppbarColor;
  ColorSwatch _tempDividerColor;
  Color _scaffoldColor = Colors.grey;
  Color colorChoosenColor;
  String _colorChoosed;
  static AppBarTheme appBarTheme1;
  ColorSwatch _accentColor = Colors.orange;
  ColorSwatch _textColor = Colors.brown;
  Color _currentColor;
  Color _pickerColor = Colors.red;
  Color _primaryTempShadeColor;
  Color _accentTempShadeColor;
  Color _scaffoldTempShadeColor;
  Color _textTempShadeColor;
  Color _appbarTempShadeColor;
  Color _dividerTempShadeColor;
  Color _primaryShadeColor = Colors.cyan[800];
  Color _accentShadeColor = Colors.amber;
  Color _appbarShadeColor = Colors.cyan[500];
  Color _dividerShadeColor = Colors.grey[800];
  Color _textShadeColor = Colors.blue[800];
  Color _scaffoldShadeColor = Colors.blue[800];
  ThemeType _themeType = ThemeType.Light;
  Color _primaryMainColor = Colors.cyan;
  ColorSwatch _appbarColor= Colors.blue;
  ColorSwatch _dividerColor= Colors.grey;



  //getters
  Color get appbarTempShadeColor => _appbarTempShadeColor;
  Color get textTempShadeColor => _textTempShadeColor;
  ColorSwatch get scaffoldColor => _scaffoldColor;
  Color get accentShadeColor => _accentShadeColor;
  Color get scaffoldTempShadeColor => _scaffoldTempShadeColor;
  ColorSwatch get appbarcolor => _appbarColor;
  Color get scaffoldShadeColor => _scaffoldShadeColor;
  Color get accentTempShadeColor => _accentTempShadeColor;
  ColorSwatch get tempScaffoldColor => _tempScaffoldColor;
  Color get primaryTempShadeColor => _primaryTempShadeColor;
  ColorSwatch get tempPrimaryMainColor => _tempPrimaryMainColor;
  Color get primaryShadeColor => _primaryShadeColor;
  ColorSwatch get accentColor => _accentColor;
  Color get primaryMainColor => _primaryMainColor;
  get pickerColor => _pickerColor;
  get currentColor => _currentColor;
  get colorChoosed => _colorChoosed;
  ColorSwatch get tempDividerColor => _tempDividerColor;
  ColorSwatch get tempAppbarColor => _tempAppbarColor;
  ColorSwatch get textColor => _textColor;
  ColorSwatch get tempAccentColor => _tempAccentColor;
  ColorSwatch get dividerColor => _dividerColor;
  ColorSwatch get tempTextColor => _tempTextColor;
  Color get dividerShadeColor => _dividerShadeColor;
  Color get appbarShadeColor => _appbarShadeColor;
  Color get textShadeColor => _textShadeColor;
  Color get dividerTempShadeColor => _dividerTempShadeColor;




  //setters

  setDividerTempShadeColor(Color value) {
    _dividerTempShadeColor = value;
    notifyListeners();
  }
  setTextShadeColor(Color value) {
    _textShadeColor = value;
    notifyListeners();
  }
  setDividerShadeColor(Color value) {
    _dividerShadeColor = value;
    notifyListeners();
  }
  setAppbarShadeColor(Color value) {
    _appbarShadeColor = value;
    notifyListeners();
  }
  setAppbarTempShadeColor(Color value) {
    _appbarTempShadeColor = value;
    notifyListeners();
  }
  setTextTempShadeColor(Color value) {
    _textTempShadeColor = value;
    notifyListeners();
  }
  setDividerColor(ColorSwatch value) {
    _dividerColor = value;
    notifyListeners();
  }
  setTextColor(ColorSwatch value) {
    _textColor = value;
    notifyListeners();
  }
  setTempAccentColor(ColorSwatch value) {
    _tempAccentColor = value;
    notifyListeners();
  }
  setTempTextColor(ColorSwatch value) {
    _tempTextColor = value;
    notifyListeners();
  }
  setTempAppbarColor(ColorSwatch value) {
    _tempAppbarColor = value;
    print('setTempAppbarColor');
    notifyListeners();
  }
  setTempDividerColor(ColorSwatch value) {
    _tempDividerColor = value;
    notifyListeners();
  }
  setScaffoldShadeColor(Color value) {
    _scaffoldShadeColor = value;
    notifyListeners();
  }
  setTempScaffoldColor(ColorSwatch value) {
    _tempScaffoldColor = value;
    notifyListeners();
  }
  setAccentTempShadeColor(Color value) {
    _accentTempShadeColor = value;
    notifyListeners();
  }
  setTempShadeColor(Color value) {
    _primaryTempShadeColor = value;
    notifyListeners();
  }
  setPrimaryShadeColor(Color value) {
    _primaryShadeColor = value;
    notifyListeners();
  }
  setTempPrimaryMainColor(Color value) {
    _tempPrimaryMainColor = value;
    notifyListeners();
  }
  setAccentColor(ColorSwatch value) {
    _accentColor = value;
    notifyListeners();
  }
  setPrimaryMainColor(Color value) {
    _primaryMainColor = value;
    notifyListeners();
  }
  set currentColor(value) {
    _currentColor = value;
    notifyListeners();
  }
  set colorChoosed(value) {
    _colorChoosed = value;
    notifyListeners();
  }
  set pickerColor(value) {
    _pickerColor = value;
    notifyListeners();
  }
  setScaffoldTempShadeColor(Color value) {
    _scaffoldTempShadeColor = value;
    notifyListeners();
  }
  setAccentShadeColor(Color value) {
    _accentShadeColor = value;
    notifyListeners();
  }
  setScaffoldColor(ColorSwatch value) {
    _scaffoldColor = value;
    notifyListeners();
  }
  setAppbarColor(ColorSwatch value) {
    _appbarColor = value;
    notifyListeners();
  }

//
//
//  colorChoosen(String value) {
//    if (value.contains("red")) {
//      colorChoosed = "red";
//      colorChoosenColor = Colors.red;
//    } else if (value.contains("blue")) {
//      colorChoosed = "blue";
//      colorChoosenColor = Colors.blue;
//    }
//    notifyListeners();
//  }
//
//  AppBarTheme currentAppBarTheme = appBarTheme1;
//
//  void toggleTheme() {
//    if (_themeType == ThemeType.Light) {
//      currentTheme = darkTheme;
//      _themeType = ThemeType.Dark;
//    } else if (_themeType == ThemeType.Dark) {
//      currentTheme = lightTheme;
//      _themeType = ThemeType.Light;
//    }
//
//    notifyListeners();
//  }
//
//  AppBarTheme changeAppBarColor(Color color, Color iconThemecolor) {
//    appBarTheme1 = AppBarTheme(
//        color: color, actionsIconTheme: IconThemeData(color: iconThemecolor));
//  }
//
//  void appBarTheme(String color) {
//    if (color.contains("red")) {
//      changeAppBarColor(Colors.red, Colors.red);
//      currentAppBarTheme = appBarTheme1;
//    } else if (color.contains("green")) {
//      changeAppBarColor(Colors.green, Colors.green);
//      currentAppBarTheme = appBarTheme1;
//    } else if (color.contains("blue")) {
//      changeAppBarColor(Colors.blue, Colors.blue);
//      currentAppBarTheme = appBarTheme1;
//    }
//    notifyListeners();
//  }


}
