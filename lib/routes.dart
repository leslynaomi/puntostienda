import 'package:flutter/material.dart';
import 'package:puntotienda/provider/welcome_page/forgot_password.dart';
import 'package:puntotienda/provider/welcome_page/login_page.dart';
import 'package:puntotienda/provider/welcome_page/sign_up_page.dart';
import 'package:puntotienda/provider/welcome_page/welcome_page.dart';
import 'package:puntotienda/widget/bottom_bar.dart';

final routes = <String, WidgetBuilder>{
  'welcome': (BuildContext context) => WelcomePage(),
  'login': (BuildContext context) => LoginPage(),
  'forgot-password': (BuildContext context) => ForgotPassword(),
  'sign-up': (BuildContext context) => SignUpPage(),
  'tabs': (BuildContext context) => BottomBarScreen(),

};
