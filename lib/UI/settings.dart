import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_multithme/Model/theme_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  Setting({Key key, this.title, this.model}) : super(key: key);
  final String title;
  ThemeModel model;
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> with SingleTickerProviderStateMixin {
  TabController _tabController;
  String picker = 'accent';
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  void _openDialog(
      ThemeModel model, String title, Widget content, String picker) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          elevation: 10,
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(
            title,
            style: TextStyle(fontFamily: 'GilroySemiBold', color: Colors.black),
          ),
          content: content,
          actions: [
            FlatButton(
              child: Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
              child: Text('SUBMIT'),
              onPressed: () {
                Navigator.of(context).pop();
//                setState(() => _mainColor = _tempMainColor);
                switch (picker) {
                  case "primary":
                    {
                      model.setPrimaryMainColor(model.tempPrimaryMainColor);
                      print("Primary Main color: ${model.primaryMainColor}");
                      model.setPrimaryShadeColor(model.primaryTempShadeColor);
                      break;
                    }
                  case "accent":
                    {
                      print("Accent main color is: ${model.tempAccentColor}");
                      print(
                          "Accent shade color is: ${model.accentTempShadeColor}");
                      model.setAccentColor(model.tempAccentColor);
                      model.setAccentShadeColor(model.accentTempShadeColor);
                      break;
                    }
                  case "scaffold":
                    {
                      print(
                          "Scaffold main color is: ${model.tempScaffoldColor}");
                      print(
                          "scaffold shade color is: ${model.accentTempShadeColor}");
                      model.setScaffoldColor(model.tempScaffoldColor);
                      model.setAccentShadeColor(model.scaffoldTempShadeColor);
                      break;
                    }

                  case "text":
                    {
                      print("text main color is: ${model.tempTextColor}");
                      print("text shade color is: ${model.textTempShadeColor}");
                      model.setTextColor(model.tempTextColor);
                      model.setTextShadeColor(model.textTempShadeColor);
                      break;
                    }

                  case "appbar":
                    {
                      print("appbar main color is: ${model.tempAppbarColor}");
                      print(
                          "appbar shade color is: ${model.appbarTempShadeColor}");
                      model.setAppbarColor(model.tempAppbarColor);
                      model.setAppbarShadeColor(model.appbarTempShadeColor);
                      break;
                    }

                  case "divider":
                    {
                      print("divider main color is: ${model.tempDividerColor}");
                      print(
                          "divider shade color is: ${model.appbarTempShadeColor}");
                      model.setDividerColor(model.tempDividerColor);
                      model.setDividerShadeColor(model.dividerTempShadeColor);
                      break;
                    }
                }

//                setState(() => _shadeColor = _tempShadeColor);
              },
            ),
          ],
        );
      },
    );
  }
  void _openFullMaterialColorPicker(ThemeModel model, Color selectedColor,
      {@required String picker}) async {
    _openDialog(
        model,
        "Theme Picker",
        Container(
          height: 210,
          child: MaterialColorPicker(
            colors: fullMaterialColors,
            selectedColor: selectedColor,
            onColorChange: (color) {
              print('onColorChange: $color');

              switch (picker) {
                case "primary":
                  {
                    model.setTempShadeColor(color);
                    break;
                  }
                case "accent":
                  {
                    model.setAccentTempShadeColor(color);
                    break;
                  }
                case "scaffold":
                  {
                    model.setScaffoldTempShadeColor(color);
                    break;
                  }
                case "text":
                  {
                    model.setTextTempShadeColor(color);
                    break;
                  }
                case "appbar":
                  {
                    model.setAppbarTempShadeColor(color);
                    break;
                  }
                case "divider":
                  {
                    model.setDividerTempShadeColor(color);
                    break;
                  }
              }
            },
            onMainColorChange: (color) {
              print('onMainColorChange: $color');
              switch (picker) {
                case "primary":
                  {
                    model.setTempPrimaryMainColor(color);
                    break;
                  }
                case "accent":
                  {
                    model.setTempAccentColor(color);
                    break;
                  }
                case "scaffold":
                  {
                    model.setTempScaffoldColor(color);
                    break;
                  }
                case "text":
                  {
                    model.setTempTextColor(color);
                    break;
                  }
                case "appbar":
                  {
                    model.setTempAppbarColor(color);
                    break;
                  }
                case "divider":
                  {
                    model.setTempDividerColor(color);
                    break;
                  }
              }
            },

//          onColorChange: (color) => setState(() => _tempShadeColor = color),
//          onMainColorChange: (color) => setState(() => _tempMainColor = color),
            onBack: () => print("Back button pressed"),
          ),
        ),
        picker);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.model,
      child: Consumer<ThemeModel>(
        builder: (_, model, __) => Scaffold(
          appBar: new AppBar(backgroundColor: model.primaryMainColor,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();},
              child: Icon(
                Icons.keyboard_backspace,
                color: Colors.white,
              ),
            ),
            title: new Text(
              "Settings",
              style: TextStyle(color: Colors.white),
            ),
            bottom: TabBar(
              unselectedLabelColor: Colors.white,
              labelColor: Colors.white,
              tabs: [
                new Tab(
                    icon: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/content.png',
                      scale: 5,
                    ),
                    Text(
                      'Multi-Theme',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )),
                new Tab(
                    icon: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/support.png',
                      scale: 5,
                    ),
                    Text(
                      'Custom Theme',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )),
              ],
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            bottomOpacity: 1,
          ),
          body: Builder(
            builder: (context) => TabBarView(
              children: [
                Column(children: <Widget>[
                  SizedBox(height: 52.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: InkWell(onTap: (){
                                    _showToast(context);
                                    model.setPrimaryMainColor(Color(0xffA600B1));
                                    model.setAppbarShadeColor(Color(0xffA600B1));
                                  },

                                    child: Container(
                                        height: 80,
                                        width: 80,
                                          color: Color(0xffA600B1)
                                        /*color: Colors.orange,*/
//                                    decoration: BoxDecoration(
//                                        shape: BoxShape.circle,
//                                        color: Color(0xffA600B1)
//                                    ),
                                      ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                    onTap: () {
                                      _showToast(context);
                                      model.setPrimaryMainColor(Color(0xffEB0060));
                                      model.setAppbarShadeColor(Color(0xffEB0060));
                                      print('hdhd');
                                    },
                                    child: ClipRRect(borderRadius: BorderRadius.circular(25),
                                      child: Container(
                                          height: 80,
                                          width: 80,
                                          color:Color(0xffEB0060)
                                        /*color: Colors.orange,*/
//                                    decoration: BoxDecoration(
//                                        shape: BoxShape.circle,
//                                        color: Color(0xffA600B1)
//                                    ),
                                      ),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                    onTap: () { _showToast(context);
                                      model.setPrimaryMainColor(Color(0xffFE3F0C));
                                    model.setAppbarShadeColor(Color(0xffFE3F0C));
                                      print('hdhd');
                                    },
                                    child: ClipRRect(borderRadius: BorderRadius.circular(25),
                                      child: Container(
                                          height: 80,
                                          width: 80,
                                          color:Color(0xffFE3F0C)
                                        /*color: Colors.orange,*/
//                                    decoration: BoxDecoration(
//                                        shape: BoxShape.circle,
//                                        color: Color(0xffA600B1)
//                                    ),
                                      ),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: <Widget>[
                                InkWell(
                                    onTap: () { _showToast(context);
                                      model.setPrimaryMainColor(Color(0xffF8D400));
                                    model.setAppbarShadeColor(Color(0xffF8D400));
                                      print('hdhd');
                                    },
                                    child: ClipRRect(borderRadius: BorderRadius.circular(25),
                                      child: Container(
                                          height: 80,
                                          width: 80,
                                          color: Color(0xffF8D400)
                                        /*color: Colors.orange,*/
//                                    decoration: BoxDecoration(
//                                        shape: BoxShape.circle,
//                                        color: Color(0xffA600B1)
//                                    ),
                                      ),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                    onTap: () { _showToast(context);
                                      model.setPrimaryMainColor(Color(0xff5600B6));
                                    model.setAppbarShadeColor(Color(0xff5600B6));
                                      print('hdhd');
                                    },
                                    child: ClipRRect(borderRadius: BorderRadius.circular(25),
                                      child: Container(
                                          height: 80,
                                          width: 80,
                                          color:Color(0xff5600B6)
                                        /*color: Colors.orange,*/
//                                    decoration: BoxDecoration(
//                                        shape: BoxShape.circle,
//                                        color: Color(0xffA600B1)
//                                    ),
                                      ),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                    onTap: () { _showToast(context);
                                      model.setPrimaryMainColor(Color(0xffC20000));
                                    model.setAppbarShadeColor(Color(0xffC20000));
                                      print('hdhd');
                                    },
                                    child: ClipRRect(borderRadius: BorderRadius.circular(25),
                                      child: Container(
                                          height: 80,
                                          width: 80,
                                          color:Color(0xffC20000)

                                      ),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: <Widget>[
                                InkWell(
                                    onTap: () { _showToast(context);
                                      model.setPrimaryMainColor(Color(0xff4977A0));
                                    model.setAppbarShadeColor(Color(0xff4977A0));
                                      print('hdhd');
                                    },
                                    child: ClipRRect(borderRadius: BorderRadius.circular(25),
                                      child: Container(
                                          height: 80,
                                          width: 80,
                                          color: Color(0xff4977A0)

                                      ),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                    onTap: () {
                                      model.setPrimaryMainColor(Color(0xff785446));
                                      model.setAppbarShadeColor(Color(0xff785446));
                                      print('hdhd');
                                    },
                                    child: ClipRRect(borderRadius: BorderRadius.circular(25),
                                      child: Container(
                                          height: 80,
                                          width: 80,
                                          color:Color(0xff785446),

                                      ),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                    onTap: () { _showToast(context);
                                      model.setPrimaryMainColor(Color(0xff169D39));
                                    model.setAppbarShadeColor(Color(0xff169D39));
                                      print('hdhd');
                                    },
                                    child: ClipRRect(borderRadius: BorderRadius.circular(25),
                                      child: Container(
                                          height: 80,
                                          width: 80,
                                          color:Color(0xff169D39)

                                      ),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                ]),
                Column(children: <Widget>[
                  SizedBox(height: 52.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 35,
                              width: 125,
                              child: RaisedButton(
                                onPressed: () => _openFullMaterialColorPicker(
                                    model, model.primaryMainColor,
                                    picker: "primary"),
                                child: const Text(
                                  'Primary Color',
                                  style: TextStyle(fontFamily: 'GilroyBold'),
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            CircleAvatar(
                              backgroundColor: model.primaryMainColor,
                              radius: 35.0,
                              child: const Text(
                                "MAIN",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'GilroySemiBold',
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            CircleAvatar(
                              backgroundColor: model.primaryShadeColor,
                              radius: 25.0,
                              child: const Text(
                                "Shade",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'GilroyLight',
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 35,
                              width: 125,
                              child: RaisedButton(
                                onPressed: () => _openFullMaterialColorPicker(
                                    model, model.accentColor,
                                    picker: "accent"),
                                child: const Text(
                                  'Accent Color',
                                  style: TextStyle(fontFamily: 'GilroyBold'),
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            CircleAvatar(
                              backgroundColor: model.accentColor,
                              radius: 35.0,
                              child: const Text(
                                "MAIN",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'GilroySemiBold',
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            CircleAvatar(
                              backgroundColor: model.accentShadeColor,
                              radius: 25.0,
                              child: const Text(
                                "Shade",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'GilroyLight',
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 35,
                              width: 125,
                              child: RaisedButton(
                                onPressed: () => _openFullMaterialColorPicker(
                                    model, model.textColor,
                                    picker: "text"),
                                child: const Text(
                                  'Text Color',
                                  style: TextStyle(fontFamily: 'GilroyBold'),
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            CircleAvatar(
                              backgroundColor: model.textColor,
                              radius: 35.0,
                              child: const Text(
                                "MAIN",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'GilroySemiBold',
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            CircleAvatar(
                              backgroundColor: model.textShadeColor,
                              radius: 25.0,
                              child: const Text(
                                "Shade",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'GilroyLight',
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 35,
                              width: 125,
                              child: RaisedButton(
                                onPressed: () => _openFullMaterialColorPicker(
                                    model, model.dividerColor,
                                    picker: "divider"),
                                child: const Text(
                                  'Divider Color',
                                  style: TextStyle(fontFamily: 'GilroyBold'),
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            CircleAvatar(
                              backgroundColor: model.dividerColor,
                              radius: 35.0,
                              child: const Text(
                                "MAIN",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'GilroySemiBold',
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            CircleAvatar(
                              backgroundColor: model.dividerShadeColor,
                              radius: 25.0,
                              child: const Text(
                                "Shade",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'GilroyLight',
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 35,
                              width: 125,
                              child: RaisedButton(
                                onPressed: () => _openFullMaterialColorPicker(
                                    model, model.appbarShadeColor,
                                    picker: "appbar"),
                                child: const Text(
                                  'AppBar Color',
                                  style: TextStyle(fontFamily: 'GilroyBold'),
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            CircleAvatar(
                              backgroundColor: model.appbarcolor,
                              radius: 35.0,
                              child: const Text(
                                "MAIN",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'GilroySemiBold',
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            CircleAvatar(
                              backgroundColor: model.appbarShadeColor,
                              radius: 25.0,
                              child: const Text(
                                "Shade",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'GilroyLight',
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ])
              ],
              controller: _tabController,
            ),
          ),

        ),
      ),
    );
  }


  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Theme Colour Applied'),
        action: SnackBarAction(
            label: 'Close', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }


}
