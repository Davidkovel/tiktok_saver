import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'src/widgets/widgets_navigation/bottom_navigation.dart';

void main() => runApp(SecondMainPage());

class SecondMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stylish Bottom Navigation Bar Example',
      theme: ThemeData(scaffoldBackgroundColor:const Color(0xff1a1a1a)),
      home: const BottomNavigationBarExample(),
      // home: const AnimatedBarExample(),
    );
  }
}


// -------------------
/*class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String tiktokUrl = 'https://www.tiktok.com/@im.orexov.mk/video/7328060389416029445?lang=ru-RU';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Downloading...'));
  }

  Future<void> downloadTikTokVideo(String tiktokUrl) async {
    try {
      final url = Uri.parse('http://127.0.0.1:8000/send_tiktok_url');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({'url': tiktokUrl}),
      );

      if (response.statusCode == 200) {
        // Assuming the response contains the video file
        print('1');
        var bytes = response.bodyBytes;
        print('2');
        var file = File('./videos');
        print('3');
        await file.writeAsBytes(bytes);
        print('Video downloaded and saved to ${file.path}');
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
*/