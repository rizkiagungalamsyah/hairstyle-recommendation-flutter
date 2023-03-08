import 'package:flutter/material.dart';
import 'package:hairstyleremomendation/widgets/chatbot.dart';
import 'package:hairstyleremomendation/widgets/recommendation.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Hairstyle Recommendation'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black),
      body: Container(
        width: 10000,
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
            width: 400.0,
            height: 100.0,
            child: ElevatedButton.icon(
              label: Text(
                'Upload',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              icon: Icon(Icons.upload_file, size: 40),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Recomendation(),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: 400.0,
            height: 100.0,
            child: ElevatedButton.icon(
              label: Text(
                'Help',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              icon: Icon(Icons.chat_bubble, size: 40),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Chatbot(),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
