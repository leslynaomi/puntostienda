import 'package:flutter/material.dart';

class CardDebit extends StatefulWidget {
  //const CardMethod({Key? key}) : super(key: key);

  @override
  _CardDebitState createState() => _CardDebitState();
}

class _CardDebitState extends State<CardDebit> {
  String nameBankDropDown = "Banco Fie";

  List<String> elements = [
    "Banco Mercantil Santa Cruz",
    "Banco Nacional de Bolivia",
    "Banco Unión",
    "Banco Central de Bolivia",
    "Banco Fie"
  ];

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
          items: elements.map((elem) {
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
                print("De aquí se programa la compra");
              },
              child: Text(
                "Comprar",
              )),
        ),
      ],
    ));
  }
}
