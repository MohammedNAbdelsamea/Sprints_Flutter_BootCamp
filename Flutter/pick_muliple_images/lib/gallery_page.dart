import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  // List to store picked image files
  List<File> _selectedImages = [];

  // Image picker instance
  final ImagePicker _picker = ImagePicker();

  // Method to pick images from gallery
  Future<void> _pickImages() async {
    try {
      // Allow multiple image selection
      final List<XFile>? pickedFiles = await _picker.pickMultiImage(
        imageQuality: 70, // Compress images to reduce memory usage
        maxWidth: 1080,   // Limit max width
      );

      // Check if images were picked
      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        // Convert XFile to File and update state
        setState(() {
          _selectedImages = pickedFiles.map((xFile) => File(xFile.path)).toList();
        });
      }
    } catch (e) {
      // Show error if image picking fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking images')),
      );
    }
  }

  // Method to remove an image
  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Gallery'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Expandable ListView to show images
          Expanded(
            child: _selectedImages.isEmpty
                ? Center(
              child: Text(
                'No images selected',
                style: TextStyle(fontSize: 18),
              ),
            )
                : ListView.builder(
              // Use ListView for vertical scrolling
              itemCount: _selectedImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      // Image display
                      Container(
                        height: 200, // Fixed height for consistent look
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            _selectedImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Delete button
                      Positioned(
                        top: 10,
                        right: 10,
                        child: IconButton(
                          icon: Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                            size: 30,
                          ),
                          onPressed: () => _removeImage(index),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Pick Image Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _pickImages,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Pick Image',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}