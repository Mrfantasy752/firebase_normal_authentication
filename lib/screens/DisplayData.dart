import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({Key? key}) : super(key: key);

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  Stream<QuerySnapshot> querySnapshot =
      FirebaseFirestore.instance.collection("collection").snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: querySnapshot,
      builder: (context, snapshot) {
        return ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemBuilder: (context, index) {
            final DocumentSnapshot documentSnapshot =
                snapshot.data!.docs[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(documentSnapshot['name']),
                subtitle: Text(documentSnapshot['price'].toString()),
                trailing: SizedBox(
                  width: 100,
                ),
              ),
            );
          },
          itemCount: snapshot.data!.docs.length,
        );
      },
    );
  }
}
