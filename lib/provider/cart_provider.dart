import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:puntotienda/src/model/CartAttr.dart';
import 'package:puntotienda/widget/cart_full.dart';

class CartProvider with ChangeNotifier {
  //Cada item corresponde a un elemento en el carrito
  Map<String, CartAttr> _cartItems = {};

  //La lista de Widgets que corresponden a cada item del carrito
  List<Widget> listWidgetTemp = [];

  // get getcartItems => this._cartItems;
  get getCartItems {
    return {..._cartItems};
  }

  void setCartItems(Map<String, CartAttr> value) => this._cartItems = value;

  get getListWidgetTemp => this.listWidgetTemp;
  void setListWidgetTemp(listWidgetTemp) =>
      this.listWidgetTemp = listWidgetTemp;

  //Vaciar la lista de productos
  void emptyCart() {
    _cartItems.clear();
    listWidgetTemp.clear();
    notifyListeners();
  }

  //Obtener todo el total (suma de subtotales) de todos los productos en el carrito
  double get getTotalAcumulado {
    double total = 0;
    _cartItems.forEach((key, value) {
      total += value.precio * value.cantidad;
    });
    return total;
  }

  //Añadir un producto al carrito con tan solo unos parámetros específicos de entrada
  //Asimismo se encarga de aumentar +1 a la cantidad del producto si ya
  //ha sido añadido al carrito
  void addProducToCart(String nombre, int precio, String imagen) {
    if (_cartItems.containsKey(nombre)) {
      _cartItems.update(
          nombre,
          (exitingCartItem) => CartAttr(
                imagen: exitingCartItem.imagen,
                nombre: exitingCartItem.nombre,
                precio: exitingCartItem.precio,
                cantidad: exitingCartItem.cantidad + 1,
              ));
    } else {
      _cartItems.putIfAbsent(
          nombre,
          () => CartAttr(
                nombre: nombre,
                precio: precio,
                cantidad: 1,
                imagen: imagen,
              ));
    }
    notifyListeners();
  }

  // void aumentarCantidad(String nombre){

  void downProducToCart(String nombre, int precio, String imagen) {
    if (_cartItems.containsKey(nombre)) {
      _cartItems.update(
          nombre,
          (exitingCartItem) => CartAttr(
                imagen: exitingCartItem.imagen,
                nombre: exitingCartItem.nombre,
                precio: exitingCartItem.precio,
                cantidad: exitingCartItem.cantidad - 1,
              ));
    } else {
      print("No se encontró el producto en el mapa de items");
    }
    notifyListeners();
  }

  //Quitar un producto del carrito
  void removeCartItem(String nombre) {
    // Map<String, CartAttr> itemsTemp = getCartItems();
    if (_cartItems.containsKey(nombre)) {
      _cartItems.remove(nombre);
      // setCartItems(itemsTemp);
    } else {
      print("No se encontró el producto en el mapa de items");
    }
    notifyListeners();
    // itemsTemp.foreach((){

    // });

    // userController.updateUserData({
    //   "cart": FieldValue.arrayRemove([cartItem.toJson()])
    // });

    // try {
    // userController.updateUserData({
    //   "cart": FieldValue.arrayRemove([cartItem.toJson()])
    // });
    // } catch (e) {
    //   Get.snackbar("Error", "Cannot remove this item");
    //   debugPrint(e.message);
    // }
  }

  // void loadCartAndWidgets() {
  //   //Lista de los Widgets que se muestran en el carrito de compras
  //   // List<Widget> listWidgetsLocal =
  //   //     Provider.of<CartProvider>(context, listen: false).getListWidgetTemp;

  //   //Limpiamos la lista de widgets
  //   listWidgetTemp.clear();
  //   //Cargando los elementos del carrito a la lista de widgets como cardProduct
  //   _cartItems.forEach((key, value) {
  //     listWidgetTemp.add(CartFull(
  //         nombre: value.nombre,
  //         imagen: value.imagen,
  //         precio: value.precio,
  //         cantidad: value.cantidad));
  //   });
    
  //   print("Productos cargados en la lista de widgets");
  //   notifyListeners();
  //   //Mandando la lista de widgets actualizada al provider
  //   // Provider.of<CartProvider>(context, listen: false)
  //   //     .setListWidgetTemp(listWidgetsLocal);
  // }
}
