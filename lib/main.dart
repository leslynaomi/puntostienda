import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:puntotienda/bottom_bar.dart';
import 'package:puntotienda/src/app.dart';
import 'package:puntotienda/src/provider/firebase_provider.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
  ChangeNotifierProvider(
  create:(_)=>User(),
  child: MyApp(),
  ),);
}

