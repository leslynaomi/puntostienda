import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/methods/database/conexion_firestore.dart';
import 'package:puntotienda/provider/cart_provider.dart';
import 'package:puntotienda/provider/nota_compra_provider.dart';
import 'package:puntotienda/provider/user_provider.dart';
import 'package:puntotienda/src/model/nota_compra.dart';

class CardDebit extends StatefulWidget {
  //const CardMethod({Key? key}) : super(key: key);

  @override
  _CardDebitState createState() => _CardDebitState();
}

class _CardDebitState extends State<CardDebit> {
  String nameBankDropDown = "Banco Fie";

  List<String> listaBancos = [
    "Banco Mercantil Santa Cruz",
    "Banco Nacional de Bolivia",
    "Banco Unión",
    "Banco Central de Bolivia",
    "Banco Fie"
  ];

  NotaCompra notaCompra = NotaCompra();

  @override
  Widget build(BuildContext context) {
    final numberCardController = TextEditingController();
    final monthController = TextEditingController();
    final yearController = TextEditingController();
    final cvvController = TextEditingController();

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15, bottom: 20),
          child: Text(
            "Pagar con tarjeta de débito",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        DropdownButton(
          value: nameBankDropDown,
          items: listaBancos.map((elem) {
            return DropdownMenuItem(value: elem, child: Text(elem));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              nameBankDropDown = newValue!;
            });
          },
          hint: Text("Seleccione un Banco"),
        ),
        Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: numberCardController,
              decoration: InputDecoration(hintText: "Número de la tarjeta"),
              //style: TextStyle(),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //mainAxisSize: MainAxisSize.min,

          children: [
            SizedBox(
              width: 120.5,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 20.0, top: 5.0, right: 5.0, bottom: 0.0),
                child: TextField(
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  controller: monthController,
                  decoration: InputDecoration(hintText: "Mes"),

                  //style: TextStyle(),
                ),
              ),
            ),
            SizedBox(
              width: 110,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 0.0, top: 5.0, right: 0.0, bottom: 0.0),
                child: TextField(
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  controller: yearController,
                  decoration: InputDecoration(hintText: "Año"),
                  //style: TextStyle(),
                ),
              ),
            ),
            SizedBox(
              width: 110,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 0.0, top: 5.0, right: 20.0, bottom: 0.0),
                child: TextField(
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  controller: cvvController,
                  decoration: InputDecoration(hintText: "CVV"),
                  //style: TextStyle(),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 28.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  primary: Colors.yellow[800]),
              onPressed: () {
                Map<String, dynamic> user = {
                  "name_user": Provider.of<UsuarioProvider>(context, listen: false).getNombre,
                  "email": Provider.of<UsuarioProvider>(context, listen: false).getEmail,
                  "teléfono": Provider.of<UsuarioProvider>(context, listen: false).getTelefono
                };
                Map<String, dynamic> cart = {
                  "montoTotal":
                      Provider.of<CartProvider>(context, listen: false).getTotalAcumulado,
                };
                Map<String, dynamic> card = {
                  "name_bank": nameBankDropDown,
                  "number_card": numberCardController.text,
                  "month": monthController.text,
                  "year": yearController.text,
                  "cvv": cvvController.text
                };

                notaCompra.fromMaps(user, cart, card);
                Provider.of<NotaCompraProvider>(context, listen: false)
                    .setNotaCompra(notaCompra);

                //Inserción de la nota en Firestore
                insertarRegistros("nota_compra", notaCompra.toMap());

                //Screen de pago efectivo
                print("Ha comprado !!");
                Navigator.pushNamed(context, "sucesfully_pay");
              },
              child: Text(
                "Comprar",
              )),
        ),
      ],
    ));
  }
}
