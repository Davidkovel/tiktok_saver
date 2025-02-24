import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../style.dart';

class SaveVideo extends StatefulWidget {
  const SaveVideo({super.key});

  @override
  State<SaveVideo> createState() => _SaveVideoState();
}

class _SaveVideoState extends State<SaveVideo> {
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
              'Video',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 3),
            Text(
              'Tutorial',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 20),
            Text(
              textInstruction_1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              textInstruction_2,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 4),
            Text(
              textInstruction_warning_2,
              style: TextStyle(
                color: Color(0xffea2d4d),
                fontSize: 14,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 16),
            Text(
              textInstruction_3,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 4),
            Text(
              textInstruction_warning_3,
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
                      MaterialPageRoute(builder: (context) => SaveVideoPage(text: text)),
                    );
                  } else {
                    print('No text found in clipboard');
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffea2d4d),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 45,
                  alignment: Alignment.center,
                  child: Text(
                    'Download Video',
                    style: TextStyle(color: Colors.white),
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

class SaveVideoPage extends StatelessWidget {
  final String text;

  SaveVideoPage({required this.text});

  Future<String> downloadTikTokVideo(String tiktokUrl) async {
    try {
      final url = Uri.parse('http://127.0.0.1:8000/send_tiktok_url?url=$tiktokUrl');
      var response = await http.post(url);

      if (response.statusCode == 200) {
        var bytes = response.bodyBytes;
        Directory? directory;

        if (Platform.isAndroid) {
          directory = await getExternalStorageDirectory();
        } else if (Platform.isIOS) {
          directory = await getApplicationDocumentsDirectory();
        }

        if (directory != null) {
          String videoPath = '${directory.path}/downloaded_video.mp4';
          File file = File(videoPath);
          await file.writeAsBytes(bytes);
          print('Video downloaded and saved to ${file.path}');
          return 'Video downloaded and saved to ${file.path}';
        } else {
          print('Error: Unable to find a valid directory');
          return 'Unable to find a valid directory';
        }
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
        return 'Ops. Some error. The video did not save. Check please the instruction';
      }
    } catch (e) {
      print('Error: $e');
      return 'Oops, an exception occurred! Make sure that you copied correctly link from tiktok';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: color_red,
      title: Text('Save Video'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
        ),
      ),
      body: FutureBuilder<String>(
        future: downloadTikTokVideo(text),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Показываем индикатор загрузки
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Center(child: Text('Saved video: ${snapshot.data}', style: TextStyle(fontSize: 24, color: Colors.white),));
          }
        },
      ),
    );
  }
}
