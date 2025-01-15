import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetCustom extends StatefulWidget {
  final Function(File?) onImageSelected;

  const BottomSheetCustom({required this.onImageSelected, super.key});

  @override
  State<StatefulWidget> createState() {
    return BottomSheetState();
  }
}

class BottomSheetState extends State<BottomSheetCustom> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedImage = await _picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
    widget.onImageSelected(_selectedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(65), topRight: Radius.circular(65)),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                _pickImage(ImageSource.gallery);
              },
              icon: const Icon(
                Icons.add_photo_alternate,
                color: Colors.black,
                size: 65,
              )),
          IconButton(
              onPressed: () => _pickImage(ImageSource.camera),
              icon: const Icon(
                Icons.add_a_photo_sharp,
                color: Colors.black,
                size: 65,
              )),
        ],
      ),
    );
  }
}
