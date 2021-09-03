import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';

class StorageImageService extends Disposable {
  

uploadImageToFirebase(File image){
  
}

// Future saveData() async {
//     if (image == null && category != null && title == category.data['title']) {
//       return null;
//     }
//     Map<String, dynamic> dataToUpdate = {};
//     if (image != null) {
//       StorageUploadTask task = FirebaseStorage.instance
//           .ref()
//           .child('icons')
//           .child(title)
//           .putFile(image);
//       StorageTaskSnapshot snap = await task.onComplete;
//       dataToUpdate['icon'] = await snap.ref.getDownloadURL();
//     }

//     if (category == null || title != category.data['title']) {
//       dataToUpdate['title'] = title;
//     }

//     if (category == null) {
//       await Firestore.instance
//           .collection('products')
//           .document(title.toLowerCase())
//           .setData(dataToUpdate);
//     } else {
//       await category.reference.updateData(dataToUpdate);
//     }
//   }


  @override
  void dispose() {}
}
