import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hairstyleremomendation/widgets/recommendation.dart';
import 'package:hairstyleremomendation/widgets/result.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Recomendation extends StatefulWidget {
  @override
  _RecomendationState createState() => _RecomendationState();
}

class _RecomendationState extends State<Recomendation> {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton.icon(
                    //if user click this button, user can upload image from gallery
                    label: Text(
                      'From Gallery',
                      style: TextStyle(
                        fontSize: 20.5,
                      ),
                    ),
                    icon: Icon(Icons.photo_camera_back),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                  ),
                  ElevatedButton.icon(
                    //if user click this button. user can upload image from camera
                    label: Text(
                      'From Camera',
                      style: TextStyle(
                        fontSize: 20.5,
                      ),
                    ),
                    icon: Icon(Icons.camera),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Recommendation'),
          centerTitle: true,
          backgroundColor: Colors.black),
      body: Container(
        height: 10000,
        width: 10000,
        color: Colors.white,
        padding: EdgeInsets.all(30),
        child: Container(
            child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                // Buat gambar
                image != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            //to show image, you type like this.
                            File(image!.path),
                            fit: BoxFit.cover,
                            width: 250,
                            // width: MediaQuery.of(context).size.width,
                            height: 300,
                          ),
                        ),
                      )
                    : Text(
                        "No Image",
                        style: TextStyle(fontSize: 20),
                      ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 300.0,
                        height: 60.0,
                        child: ElevatedButton.icon(
                          label: Text(
                            'Upload',
                            style: TextStyle(
                              fontSize: 20.5,
                            ),
                          ),
                          icon: Icon(Icons.camera_alt_rounded),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          onPressed: () => {myAlert()},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  width: 350.0,
                  height: 60.0,
                  child: ElevatedButton.icon(
                    label: Text(
                      'Results',
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                    icon: Icon(Icons.photo_album),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Result(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
