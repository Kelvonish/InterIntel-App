import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> registerUser(String name, String email, String phone) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  try {
    await users.add({
      'name': name,
      'email': email,
      'phone': phone,
    }).then((value) => {
          print('success'),
        });
    return true;
  } catch (e) {
    Fluttertoast.showToast(
      msg: e.toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 15.0,
    );
    return false;
  }
}
