import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class AccountController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  Uint8List? img;
  final FirebaseStorage storage = FirebaseStorage.instance;
  Future<String> savePhoto({
    required Uint8List image,
  }) async {
    String resp = "Some error";
    try {
      String imageUrl = await uploadImageToStorage('profileimage', image);
      await firestore.collection('Users').add({'imageLink': imageUrl});
      resp = 'success';
    } catch (e) {
      resp = e.toString();
    }
    return resp;
  } pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    }
    print('$source');
  }

 void selectImage() async {
    Uint8List img1 = await pickImage(ImageSource.gallery);
    img = img1;
  }
  Future<String> uploadImageToStorage(String childname, Uint8List file) async {
    Reference ref = storage.ref().child(childname);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String download = await snapshot.ref.getDownloadURL();
    return download;
  }
}
