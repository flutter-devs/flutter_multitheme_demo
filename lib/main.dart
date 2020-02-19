
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multithme/Constants/constants.dart';
import 'package:flutter_multithme/Model/theme_model.dart';
import 'package:flutter_multithme/UI/Widgets/splash_screen.dart';
import 'package:flutter_multithme/UI/main_ui.dart';
import 'package:flutter_multithme/UI/settings.dart';
import 'package:provider/provider.dart';


void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider<ThemeModel>(
      create: (_) => ThemeModel(),
    ),
  ],
  child: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ChangeNotifierProvider<ThemeModel>(
        create: (BuildContext context) => ThemeModel(),
        child: Consumer<ThemeModel>(builder: (context, model, __) {
          return MaterialApp(
            initialRoute: SPLASH_SCREEN ,
            routes: <String, WidgetBuilder>{
              MAIN_UI: (BuildContext context) => MainUI(model),
              SPLASH_SCREEN: (BuildContext context) => AnimatedSplashScreen(),
              SETTINGS_SCREEN:(BuildContext context) => Setting(),
            },
            darkTheme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              dividerColor: model.dividerColor,
              textTheme: Theme.of(context).textTheme.apply(
                bodyColor: model.textColor,
                displayColor: model.textColor),
              appBarTheme: AppBarTheme(color: model.appbarcolor),
              primaryColor: model.primaryMainColor,
              accentColor: model.accentColor,
            ),
            title: 'Flutter Multi Theme',
          );
        }));
  }
}
