import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LisCategoria extends StatefulWidget {
  LisCategoria({Key? key}) : super(key: key);

  @override
  _LisCategoriaState createState() => _LisCategoriaState();
}

class _LisCategoriaState extends State<LisCategoria> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('AllCategoria').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data!.docs.map((document) {
              return Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Text("Title " + document['Nombre']),
                ),
              );
            }).toList(),
          );
        });
  }
}
