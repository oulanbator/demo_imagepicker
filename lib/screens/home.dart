import 'dart:io';

import 'package:demo_imagepicker/screens/components/image_picker_modal.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // La vue contient une image (une fois sélectionnée)
          _pictureContainer(),
          // Et un bouton pour afficher la modale de l'image picker
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () => _showImagePickerModal(context),
          ),
        ],
      ),
    );
  }

  /// Renvoie une image si _picture est != null
  Widget _pictureContainer() {
    if (_picture != null) {
      return Image.file(_picture!);
    }

    return Container();
  }

  /// Renvoie la modale pour choisir la source de l'image (Galerie / Camera)
  void _showImagePickerModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ImagePickerModal(
          // Lorsque le callback onChoice est appelé, passe la "source" à la méthode _pickImage
          onChoice: (source) => _pickImage(source),
        );
      },
    );
  }

  /// Permet l'affichage de l'imagePicker lui-même en fonction de la source
  Future<void> _pickImage(ImageSource source) async {
    await ImagePicker()
        .pickImage(
          source: source,
          maxHeight: 1000,
          maxWidth: 1000,
          imageQuality: 100,
        )
        // Si l'image a été choisie, appelle la méthode _setImage, sinon ne fait rien
        .then((XFile? image) => image != null ? _setImage(image) : null);
  }

  /// Affecte l'image dans la variable _picture avec setState (pour forcer un nouveau rendu de notre widget)
  void _setImage(XFile image) {
    setState(() {
      _picture = File(image.path);
    });
  }
}
