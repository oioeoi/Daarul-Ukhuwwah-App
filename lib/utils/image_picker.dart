import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

File? _selectImage;

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  pictImageFromGalery() async {
    final ImagePicker _imagePicker = ImagePicker();
    final pickedImage = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    if (pickedImage == null) return;
    setState(() => _selectImage = File(pickedImage.path));
  }

  pictImageFromCamera() async {
    final ImagePicker _imagePicker = ImagePicker();
    final pickedImage = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    if (pickedImage == null) return;
    setState(() => _selectImage = File(pickedImage.path));
  }
}


/*
input setting for ios and goto === ios => runner => Base.lproj => info.plist
    <key>NSPhotoLibraryUsageDescription</key>
		<string>Photo Library Usage Description</string> 
		<key>NSCameraUsageDescription</key>
		<string>Camera Usage Description</string> 
		<key>NSMicrophoneUsageDescription</key>
		<string>Microphone Usage Description</string>
*/