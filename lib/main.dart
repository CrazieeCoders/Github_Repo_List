import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repo/Themes/styling.dart';

import 'MyHomePage.dart';
import 'Themes/size_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        return OrientationBuilder(
            builder: (context,orientation){
              SizeConfig().init(constraints,orientation);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.yellow,
                ),
                home: MyHomePage(),
              );
            }

        );
      }
    );
  }
}

