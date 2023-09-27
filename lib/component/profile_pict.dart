import 'dart:io';
import 'package:daarul_ukhuwwah_media/screens/pict_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePict extends StatefulWidget {
  const ProfilePict({super.key});
  @override
  State<ProfilePict> createState() => _ProfilePictState();
}

class _ProfilePictState extends State<ProfilePict> {
  File? _selectImage;
  bool _isFilled = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _isFilled && _selectImage != null
            ? GetPictProfile()
            : Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey[100],
                  image: DecorationImage(
                    image: AssetImage('assets/profile.jpeg'),
                  ),
                ),
              ),
        TextButton(
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                    onPressed: () {
                      setState(
                        () {
                          pictImageFromGalery();
                          _isFilled = true;
                          Navigator.pop(context);
                        },
                      );
                    },
                    child: Text(
                      'Choose Photo',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      setState(() {
                        pictImageFromCamera();
                        _isFilled = true;
                        Navigator.pop(context);
                      });
                    },
                    child: Text(
                      'Take Photo',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                ],
                cancelButton: CupertinoActionSheetAction(
                  onPressed: () {
                    setState(() {
                      _isFilled = false;
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    'Delete Photo',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
          child: Text(
            'Edit',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  Widget GetPictProfile() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProfileScreen(
              item: FileImage(_selectImage!),
            ),
          ),
        );
      },
      child: Hero(
        tag: FileImage(_selectImage!),
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(_selectImage!),
            ),
          ),
        ),
      ),
    );
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
