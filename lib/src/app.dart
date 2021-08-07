import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
//import 'package:puntotienda/methods/database/conexion_firestore.dart';
import 'package:puntotienda/provider/producto_provider.dart';
import 'package:puntotienda/provider/user_provider.dart';

import 'package:puntotienda/routes.dart';

//import '../widget/bottom_bar.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UsuarioSingUp(),
          ),
          ChangeNotifierProvider(
            create: (_) => Products(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: routes,
          initialRoute: 'welcome',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        ));
  }
}
