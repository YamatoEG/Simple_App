import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MediaAccess extends StatefulWidget {
  const MediaAccess({super.key});

  @override
  State<MediaAccess> createState() => _MediaAccessState();
}

class _MediaAccessState extends State<MediaAccess> {
  ImagePicker picker = ImagePicker();
  File? imagefile;
  List<XFile> images = [];

  Future<void> pickImages() async {
    final List<XFile>? pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      setState(() {
        images = pickedFiles; // Update the state with selected images
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Media Access",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey,
        child: Column(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent,
                ),
                onPressed: pickImages,
                child: Text(
                  "Pick Image",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Expanded(
              child: images.isNotEmpty
                  ? ListView.builder(
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          child: Image.file(
                            File(images[index].path),
                            width: 70,
                            height: 200,
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        "No images selected yet.",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
