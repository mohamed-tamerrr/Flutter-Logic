import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadMultiImages extends StatefulWidget {
  const UploadMultiImages({super.key});

  @override
  State<UploadMultiImages> createState() =>
      _UploadMultiImagesState();
}

class _UploadMultiImagesState extends State<UploadMultiImages> {
  List<XFile?> selectedImages = [null, null, null];

  Future<void> _uploadImages() async {
    final pickedImages = await ImagePicker().pickMultiImage(
      limit: 3,
    );
    setState(() {
      for (int i = 0; i < pickedImages.length && i < 3; i++) {
        selectedImages[i] = pickedImages[i];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade900,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 140),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(selectedImages.length, (
                  index,
                ) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: selectedImages[index] != null
                        ? Image.file(
                            File(selectedImages[index]!.path),
                            fit: BoxFit.cover,
                          )
                        : Icon(
                            Icons.image,
                            color: Colors.white,
                            size: 50,
                          ),
                  );
                }),
              ),
            ),
            SizedBox(height: 20),

            /// Button to upload image
            GestureDetector(
              onTap: _uploadImages,
              child: Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: .3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Upload Images',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
