import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childname, Uint8List file) async {
    Reference ref = _storage.ref().child(childname);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    await snapshot.ref.getDownloadURL();
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData(
      {required String name,
        required Uint8List file,
      }) async {
    String resp = "Some Error Occurred";
        try{
          if(name.isNotEmpty) {
            String imageUrl = await uploadImageToStorage('profileImage', file);
            await _firestore.collection('userProfile').add({
              'name': name,
              'imageLink': imageUrl,
            });
            resp = 'Success';
          }
        }
            catch(err){
              resp = err.toString();
            }
            return resp;

  }
}
