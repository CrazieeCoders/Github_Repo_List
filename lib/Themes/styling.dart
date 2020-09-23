import 'package:flutter/material.dart';
import 'package:github_repo/Themes/size_config.dart';


class AppTheme {
  AppTheme._();

  static const Color appBackgroundColor = Color(0xFFFFF7EC);
  static const Color topBarBackgroundColor = Color(0xFFFFD974);
  static const Color primaryColor = Color(0xFFFFD974);
  static const Color subTitleTextColor = Color(0xFF9F988F);


  static final TextStyle userTitle = TextStyle(
    color: Colors.black,
    fontSize: 2.0 * SizeConfig.textMultiplier,
  );

  static final TextStyle headerTitle = TextStyle(
    color: Colors.black,
    fontSize: 2.3 * SizeConfig.textMultiplier,
    height: 1.0,
  );

  static final TextStyle descTitle = TextStyle(
    color: subTitleTextColor,
    fontSize: 1.7 * SizeConfig.textMultiplier,
  );




}