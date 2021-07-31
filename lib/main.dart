import 'package:flutter/material.dart';
import 'package:puntotienda/bottom_bar.dart';
import 'package:puntotienda/pages/admin/admin.dart';
import 'package:puntotienda/pages/admin/admin_categoria.dart';
import 'package:puntotienda/pages/admin/admin_productos.dart';
import 'package:puntotienda/pages/forgot_password.dart';
import 'package:puntotienda/pages/login_page.dart';
import 'package:puntotienda/pages/sign_up_page.dart';
import 'package:puntotienda/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
          'welcome' : (BuildContext context) => WelcomePage(),
          'login' : (BuildContext context) => LoginPage(),
          'forgot-password': (BuildContext context) => ForgotPassword(),  
          'sign-up' : (BuildContext context) => SignUpPage(),
          'BottomBarScreen' : (BuildContext context) => BottomBarScreen(),
          
          'AreaAdmin' : (BuildContext context) => Administracion(),
          'Productos' : (BuildContext context) => AdminProductos(),
          'Categoria' : (BuildContext context) => AdminCategoria(),
      },
      initialRoute: 'welcome',
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      
      //El widget que está por defecto como primero a mostrar y con su respectiva ruta 
      //home: BottomBarScreen(),
    );
  }
}
