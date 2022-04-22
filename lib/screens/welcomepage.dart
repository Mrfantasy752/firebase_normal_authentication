import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'DisplayData.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("collection");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Crud Operations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                primary: Colors.deepPurple,
                minimumSize: const Size(100, 50),
              ),
              onPressed: () {
                snackbardata(context);
              },
              child: const Text("Add"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                primary: Colors.deepPurple,
                minimumSize: const Size(100, 50),
              ),
              onPressed: () {
                deleteData();
              },
              child: const Text("Delete"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                primary: Colors.deepPurple,
                minimumSize: const Size(100, 50),
              ),
              onPressed: () {
                snackbardata(context);
              },
              child: const Text("Update"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                primary: Colors.deepPurple,
                minimumSize: const Size(100, 50),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisplayData(),
                    ));
                // const DisplayData();
              },
              child: const Text("Read"),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  addData(String name, String age) {
    Map<String, dynamic> data = {"name": name, "age": age};
    collectionReference.add(data);
  }

  readData() {
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        ListTile(
          leading: doc["name"],
          title: doc["age"],
        );
      });
    });
  }

  deleteData() async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs[0].reference.delete();
  }

  updateData(String name, String age) async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    snackbardata(context);
    querySnapshot.docs[0].reference.update({"name": name, "age": age});
  }

  snackbardata(context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController agecontroller = TextEditingController();
    final snackBar = SnackBar(
      duration: Duration(minutes: 2),
      backgroundColor: Colors.white,
      action: SnackBarAction(
        onPressed: () {},
        label: '',
      ),
      content: Padding(
        padding: const EdgeInsets.only(left: 60),
        child: Container(
          height: 200,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: namecontroller,
                  decoration: const InputDecoration(
                    iconColor: Colors.blueGrey,
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    hintText: "enter name",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: agecontroller,
                  decoration: const InputDecoration(
                    iconColor: Colors.blueGrey,
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    hintText: "enter age",
                    prefixIcon: Icon(Icons.date_range),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        addData(namecontroller.text.trim().toString(),
                            agecontroller.text.trim().toString());
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                      child: Text("add"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black12,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        updateData(namecontroller.text.trim().toString(),
                            agecontroller.text.trim().toString());
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                      child: Text("update"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
