import 'package:flutter/material.dart';
import 'package:puntotienda/inner_screens/product_detalle.dart';
import 'package:puntotienda/pages/admin/admin_page.dart';
import 'package:puntotienda/pages/admin/admin_categoria.dart';
import 'package:puntotienda/pages/admin/admin_productos.dart';
import 'package:puntotienda/pages/user/methods_payment/card_debit.dart';
import 'package:puntotienda/pages/user/methods_payment/sucesfully_pay.dart';
import 'package:puntotienda/provider/welcome_page/welcome_page.dart';
import 'package:puntotienda/provider/welcome_page/forgot_password.dart';
import 'package:puntotienda/provider/welcome_page/login_page.dart';
import 'package:puntotienda/provider/welcome_page/sign_up_page.dart';
import 'package:puntotienda/screens/cart.dart';
import 'package:puntotienda/screens/feeds.dart';
import 'package:puntotienda/screens/wishlist.dart';
import 'package:puntotienda/widget/bottom_bar.dart';

final routes = <String, WidgetBuilder>{
  'welcome': (BuildContext context) => WelcomePage(),
  'login': (BuildContext context) => LoginPage(),
  'forgot-password': (BuildContext context) => ForgotPassword(),
  'sign-up': (BuildContext context) => SignUpPage(),
  'tabs': (BuildContext context) => BottomBarScreen(),
  'detalles': (BuildContext context) => Productodetalles(),
  'carrito': (BuildContext context) => CartScreen(),
  'cartproducts': (BuildContext context) => FeedsScreen(),
  'favoritos': (BuildContext context) => WishlistScreen(),

  'BottomBarScreen': (BuildContext context) => BottomBarScreen(),
  'AreaAdmin': (BuildContext context) => Administracion(),
  'Productos': (BuildContext context) => AdminProductos(),
  'Categoria': (BuildContext context) => AdminCategoria(),
  'card_debit': (BuildContext context) => CardDebit(),
  'sucesfully_pay': (BuildContext context) => PagoExitoso(),
};
