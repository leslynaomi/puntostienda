import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/consts/colors.dart';
import 'package:puntotienda/provider/cart_provider.dart';

class CartFull extends StatefulWidget {
  final String nombre;
  final String imagen;
  final int precio;
  final int cantidad;

  CartFull(
      {required this.nombre,
      required this.imagen,
      required this.precio,
      required this.cantidad});
  
  @override
  _CartFullState createState() => _CartFullState(
      nombre: this.nombre,
      imagen: this.imagen,
      precio: this.precio,
      cantidad: this.cantidad);
}

class _CartFullState extends State<CartFull> {
  final String nombre;
  final String imagen;
  final int precio;
  int cantidad;

  _CartFullState(
      {required this.nombre,
      required this.imagen,
      required this.precio,
      required this.cantidad});

  // get getNombre => this.nombre;

  @override
  Widget build(BuildContext context) {
    int subtotal = 0;

    // return cardProduct(context, nombre, imagen, precio, cantidad);
    return SingleChildScrollView(
        child: Container(
      height: 165,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: const Radius.circular(16.0),
          topRight: const Radius.circular(16.0),
        ),
        color: Colors.lightBlueAccent,
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imagen),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          nombre,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32.0),
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.clear_sharp,
                              color: Colors.redAccent,
                              size: 22,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text('Precio:'),
                      Text(
                        (precio).toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text('Sub Total:'),
                      Text(
                        subtotal.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.brown.shade900),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Envio Gratis',
                        style: TextStyle(color: Colors.brown.shade900),
                      ),
                      Spacer(),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(4.0),
                          onTap: () {
                            print("Botón disminuir cantidad");
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.minimize,
                                color: Colors.redAccent,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 12,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.12,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              ColorsConst.gradiendLStart,
                              ColorsConst.gradiendLEnd,
                            ], stops: [
                              0.0,
                              0.7
                            ]),
                          ),
                          child: Text(
                            (cantidad).toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(4.0),
                          onTap: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .addProducToCart(nombre, precio, imagen);

                            setState(() {
                              cantidad++;
                            });

                            print("aumentar cantidad");
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.plus_one,
                                color: Colors.green,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

Widget cardProduct(BuildContext context, String nombre, String imagen,
    int precio, int cantidad) {
  int subtotal = 0;

  return SingleChildScrollView(
      child: Container(
    height: 165,
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomRight: const Radius.circular(16.0),
        topRight: const Radius.circular(16.0),
      ),
      color: Colors.lightBlueAccent,
    ),
    child: Row(
      children: [
        Container(
          width: 120,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imagen),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        nombre,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(32.0),
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.clear_sharp,
                            color: Colors.redAccent,
                            size: 22,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('Precio:'),
                    Text(
                      (precio).toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('Sub Total:'),
                    Text(
                      subtotal.toString(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.brown.shade900),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Envio Gratis',
                      style: TextStyle(color: Colors.brown.shade900),
                    ),
                    Spacer(),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(4.0),
                        onTap: () {
                          print("Botón disminuir cantidad");
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.minimize,
                              color: Colors.redAccent,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 12,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            ColorsConst.gradiendLStart,
                            ColorsConst.gradiendLEnd,
                          ], stops: [
                            0.0,
                            0.7
                          ]),
                        ),
                        child: Text(
                          (cantidad).toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(4.0),
                        onTap: () {
                          // Provider.of<CartProvider>(context, listen: false)
                          //     .addProducToCart(nombre, precio, imagen);

                          // setState(() {
                          //   cantidad++;
                          // });

                          print("aumentar cantidad");
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.plus_one,
                              color: Colors.green,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ),
  ));
}
