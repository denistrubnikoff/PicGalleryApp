import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pic_gal_flutter/widgets/Authorization/auth_widget.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme:  AppBarTheme(
            backgroundColor: const Color.fromRGBO(63, 68, 15, 1)),
      ),
      home: AuthWidget(),
    );
  }
}

