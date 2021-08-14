import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puntotienda/src/model/product.dart';

import 'cart.dart';

enum Productos {
  normal,
  detalles,
  cart,
}

class Notificacion extends ChangeNotifier {
  String nombre = '';
  String descripcion = '';
  String precio = '';
  void changeUser(String newnombre, String newdescripcion, String newprecio) {
    nombre = newnombre;
    descripcion = newdescripcion;
    precio = newprecio;
    notifyListeners();
  }
}

/*class NotaCompr with ChangeNotifier {
  Productos productos = Productos.normal;
  List<Productos> catalogo = List.unmodifiable(productos);
  List<Productos> cart = [];

  void changeToNormal() {
    productos = Productos.normal;
    notifyListeners();
  }

  void changeTocart() {
    productos = Productos.cart;
    notifyListeners();
  }

  void addProduct(Productos product) {
    for (ProductosProductItem in cart) {
      if (item.product.name == product.name) {
        item.increment();
        notifyListeners();
        return;
      }
   }
    cart.add(ProductosProductItem(product: product));
    notifyListeners();
  

  int totalCartElements() => cart.fold<int>(
        0,(previousValue, element) => previousValue + element.quantity,
      );
     
   double totalPriceElements() => cart.fold<double>(
        0.0,
        (previousVale, element) => previousValue + (element.quantity *element.product.price)
      );
      
}*/

class NotaCompra extends StatelessWidget {
  const NotaCompra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final bloc = GroceryProvider.of(context).bloc;
    return Scaffold(
      appBar: AppBar(
        title: Text("NOTA DE COMPRA"),
      ),
      body: Column(
        children: <Widget>[
          // SizedBox(
          // width: MediaQuery.of(context).size.width,
          Row(
            children: [
              const SizedBox(height: 20),
              Text(
                'Imagen:',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                '',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
          Row(
            children: [
              const SizedBox(height: 20),
              Text(
                'Nombre:',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                '',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),

          Row(
            children: [
              const SizedBox(height: 20),
              Text(
                'Cantidad:',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                '',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),

          Row(
            children: [
              const SizedBox(height: 20),
              Text(
                'Precio:',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                '\Bs 0 ',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),

          Row(
            children: [
              const SizedBox(height: 500),
              Text(
                'Total:',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                '\Bs 0 ',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black,
                      fontWeight:  FontWeight.bold,
                    ),
              )
            ],
          ),

          ElevatedButton(
              child: Text('Comprar por Paypal'),
              onPressed: () {
                Navigator.pushNamed(context, "NotaCompra");
              },
            ),
        ],
      ),
    );
  }
}
