import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:convert';

import '../style.dart';

class FindMusic extends StatefulWidget {
  const FindMusic({super.key});

  @override
  State<FindMusic> createState() => _FindMusicState();
}

class _FindMusicState extends State<FindMusic> {
  final String textInstruction_1 = "1. In the TikTok app, go to the video you'd like to download.\n";
  final String textInstruction_2 = "2. Tap Save video. If you don't have the option to save a video.";
  final String textInstruction_warning_2 = "Make sure the vide is available to the public";
  final String textInstruction_3 = "3. Tap Save video. If you don't have the option to save a video, this means the creator doesn't allow it.";
  final String textInstruction_warning_3 = "The video will appear in your library";
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Video', // New text: Video
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 3),
          Text(
            'Tutorial', // New text: Tutorial
            style: TextStyle(
              color: Colors.grey,
              fontSize: 17,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 20,),
          Text(
            textInstruction_1, // Replace with your existing text
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'Roboto',
            ),
          ),
          Text(
            textInstruction_2, // Replace with your existing text
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 4),
          Text(
            textInstruction_warning_2, // Replace with your existing text
            style: TextStyle(
              color: Color(0xffea2d4d),
              fontSize: 14,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 16),
          Text(
            textInstruction_3, // Replace with your existing text
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 4),
          Text(
            textInstruction_warning_3, // Replace with your existing text
            style: TextStyle(
              color: Color(0xffea2d4d),
              fontSize: 14,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 250),
          Padding(
          padding: EdgeInsets.only(top: 10, right: 10),
          child: ElevatedButton(
            onPressed: () async {
              final clipboardText = await Clipboard.getData(Clipboard.kTextPlain);
              if (clipboardText != null) {
                final String text = clipboardText.text ?? '';
                urlController.text = text;
                print('Last copied text: $text');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MusicPage(text: text)),
                );
              } else {
                print('No text found in clipboard');
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xffea2d4d), // Цвет фона кнопки (красный)
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Container(
              width: double.infinity, // Растягиваем кнопку на всю ширину
              height: 45,
              alignment: Alignment.center, // Выравниваем текст по центру
              child: Text(
                'Find Music 2', // Замените на свой текст кнопки
                style: TextStyle(color: Colors.white), // Цвет текста (белый)
              ),
            ),
          ),
        )
        ],
      ),
    ),
  );
}
}

class MusicPage extends StatelessWidget {
  final String text;

  MusicPage({required this.text});

  Future<String> findMusic(String tiktokUrl) async {
    try {
      final url = Uri.parse('http://127.0.0.1:8000/define_music?url=$tiktokUrl');
      var response = await http.post(url);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var songLink = jsonResponse['song_links'];
        print('Song link: $songLink');
        return songLink;
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
        return 'Oops, some error!';
      }
    } catch (e) {
      print(e);
      return 'Oops, an exception occurred!';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: color_red,
      title: Text('Find Music'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context); // Вернуться на предыдущую страницу
        },
        ),
      ),
      body: FutureBuilder<String>(
        future: findMusic(text),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Показываем индикатор загрузки
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Center(child: Text('Song link: ${snapshot.data}', style: TextStyle(fontSize: 24, color: Colors.white),));
          }
        },
      ),
    );
  }

}
