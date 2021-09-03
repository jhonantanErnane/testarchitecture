import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheetWidget extends StatelessWidget {
  final Function(File?) onImageSelected;
  const ImageSourceSheetWidget({required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    final ImagePicker imagePicker = ImagePicker();
    return BottomSheet(
      builder: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FlatButton(
            child: Text('Câmera'),
            onPressed: () async {
              XFile? file =
                  await imagePicker.pickImage(source: ImageSource.camera);
              _imageSelected(file);
            },
          ),
          FlatButton(
            child: Text('Galeria'),
            onPressed: () async {
              XFile? file =
                  await imagePicker.pickImage(source: ImageSource.gallery);
              _imageSelected(file);
            },
          )
        ],
      ),
      onClosing: () {},
    );
  }

  Future<void> _imageSelected(XFile? image) async {
    try {
      if (image != null) {
        File? croppedImage = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          androidUiSettings: AndroidUiSettings(
              statusBarColor: Colors.black,
              toolbarColor: Colors.black,
              toolbarWidgetColor: Colors.white,
              toolbarTitle: 'Editar Foto'),
        );
        return onImageSelected(croppedImage);
      }
      return onImageSelected(null);
    } catch (e) {
      print(e.toString());
      onImageSelected(null);
    }
  }
}
