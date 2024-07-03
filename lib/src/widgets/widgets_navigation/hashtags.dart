import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

import '../style.dart';

class LaunchUrlTiktok {
  final String hashtagType;

  LaunchUrlTiktok ({
    required this.hashtagType,
  });

  Future<String> launchUrl() async {
    switch (this.hashtagType) {
      case "fyp":
        return await _urlTiktokFyp();
      case "viral":
        return await _urlTiktokViral();
      case "foryou":
        return await _urlTiktokForyou();
      case "foryoupage":
        return await _urlTiktokForyoupage();
      case "tiktok":
        return await _urlTiktok_TikTok();
      case "viravideo":
        return await _urlTiktokViralvideo();
      case "trend":
        return await _urlTikTokTrend();
      case "xyzbca":
        return await _urlTikTokXyzbca();
      default:
        return "Invalid hashtag type";
    }
  }

  Future<String> _urlTiktokFyp() async {
    return "https://vm.tiktok.com/ZMr6snrpx/";
  }

  Future<String> _urlTiktokViral() async {
    return "";
  }

  Future<String> _urlTiktokForyou() async {
    return "";
  }

  Future<String> _urlTiktokForyoupage() async {
    return "";
  }

  Future<String> _urlTiktok_TikTok() async {
    return "";
  }

  Future<String> _urlTiktokViralvideo() async {
    return "";
  }

  Future<String> _urlTikTokTrend() async {
    return "";
  }

  Future<String> _urlTikTokXyzbca() async {
    return "";
  }
  
}

class Hashtags extends StatelessWidget {
  const Hashtags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 60, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Выравнивание всех элементов по левому краю
          children: <Widget>[
            Text(
              'Hashtags',
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 14,),
                  Material( //Color.fromARGB(255, 243, 137, 137)
                    color: color_red,
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      title: const Text('#fyp', style: TextStyle(color: Colors.white)),
                      subtitle: Row(
                        children: [
                          Icon(Icons.videocam),
                          SizedBox(width: 4,),
                          const Text('616.2 Million', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                          SizedBox(width: 10),
                          Icon(Icons.remove_red_eye),
                          SizedBox(width: 4,),
                          const Text('Views: 49 Trillion', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                        ],
                      ),
                      onTap: () async {
                          LaunchUrlTiktok launcherTiktok = LaunchUrlTiktok(hashtagType: "fyp");
                          String url = await launcherTiktok.launchUrl();
                          print('check url lauch $url');

                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            print("Could not launch $url");
                          }
                      },
                    ),
                  ),
                  SizedBox(height: 14,),
                  // Добавьте другие Material элементы здесь
                  Material( //Color.fromARGB(255, 243, 137, 137)
                    color: color_red,
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      title: const Text('#viral', style: TextStyle(color: Colors.white)),
                      subtitle: Row(
                        children: [
                          Icon(Icons.videocam),
                          SizedBox(width: 4,),
                          const Text('1.9 Billion', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                          SizedBox(width: 10),
                          Icon(Icons.remove_red_eye),
                          SizedBox(width: 4,),
                          const Text('Views: 19.3 Trillion', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                        ],
                      ),
                      onTap: () async {
                          LaunchUrlTiktok launcherTiktok = LaunchUrlTiktok(hashtagType: "viral");
                          String url = await launcherTiktok.launchUrl();
                          print('check url lauch $url');

                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            print("Could not launch $url");
                          }
                      },
                    ),
                  ),
                  SizedBox(height: 14,),
                  Material(
                    color: color_red,
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      title: const Text('#foryou', style: TextStyle(color: Colors.white)),
                      subtitle: Row(
                        children: [
                          Icon(Icons.videocam),
                          SizedBox(width: 4,),
                          const Text('707.5 Million', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                          SizedBox(width: 10),
                          Icon(Icons.remove_red_eye),
                          SizedBox(width: 4,),
                          const Text('Views: 29 Trillion', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                        ],
                      ),
                      onTap: () async {
                          LaunchUrlTiktok launcherTiktok = LaunchUrlTiktok(hashtagType: "foryou");
                          String url = await launcherTiktok.launchUrl();
                          print('check url lauch $url');

                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            print("Could not launch $url");
                          }
                      },
                    ),
                  ),
                  SizedBox(height: 14,),
                  Material(
                    color: color_red,
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      title: const Text('#foryoupage', style: TextStyle(color: Colors.white)),
                      subtitle: Row(
                        children: [
                          Icon(Icons.videocam),
                          SizedBox(width: 4,),
                          const Text('1.5 Billion', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                          SizedBox(width: 10),
                          Icon(Icons.remove_red_eye),
                          SizedBox(width: 4,),
                          const Text('Views: 18 Trillion', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                        ],
                      ),
                      onTap: () async {
                          LaunchUrlTiktok launcherTiktok = LaunchUrlTiktok(hashtagType: "foryou");
                          String url = await launcherTiktok.launchUrl();
                          print('check url lauch $url');

                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            print("Could not launch $url");
                          }
                      },
                    ),
                  ),
                  SizedBox(height: 14,),
                  Material(
                    color: color_red,
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      title: const Text('#tiktok', style: TextStyle(color: Colors.white)),
                      subtitle: Row(
                        children: [
                          Icon(Icons.videocam),
                          SizedBox(width: 4,),
                          const Text('1.1 Billion', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                          SizedBox(width: 10),
                          Icon(Icons.remove_red_eye),
                          SizedBox(width: 4,),
                          const Text('Views: 6.4 Trillion', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                        ],
                      ),
                      onTap: () async {
                          LaunchUrlTiktok launcherTiktok = LaunchUrlTiktok(hashtagType: "foryou");
                          String url = await launcherTiktok.launchUrl();
                          print('check url lauch $url');

                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            print("Could not launch $url");
                          }
                      },
                    ),
                  ),
                  SizedBox(height: 14,),
                  Material(
                    color: color_red,
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      title: const Text('#viralvideo', style: TextStyle(color: Colors.white)),
                      subtitle: Row(
                        children: [
                          Icon(Icons.videocam),
                          SizedBox(width: 4,),
                          const Text('451.7 Million', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                          SizedBox(width: 10),
                          Icon(Icons.remove_red_eye),
                          SizedBox(width: 4,),
                          const Text('Views: 2.3 Trillion', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                        ],
                      ),
                      onTap: () async {
                          LaunchUrlTiktok launcherTiktok = LaunchUrlTiktok(hashtagType: "foryou");
                          String url = await launcherTiktok.launchUrl();
                          print('check url lauch $url');

                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            print("Could not launch $url");
                          }
                      },
                    ),
                  ),
                  SizedBox(height: 14,),
                  Material(
                    color: color_red,
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      title: const Text('#trend', style: TextStyle(color: Colors.white)),
                      subtitle: Row(
                        children: [
                          Icon(Icons.videocam),
                          SizedBox(width: 4,),
                          const Text('264.4 Million', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                          SizedBox(width: 10),
                          Icon(Icons.remove_red_eye),
                          SizedBox(width: 4,),
                          const Text('Views: 2.3 Trillion', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                        ],
                      ),
                      onTap: () async {
                          LaunchUrlTiktok launcherTiktok = LaunchUrlTiktok(hashtagType: "foryou");
                          String url = await launcherTiktok.launchUrl();
                          print('check url lauch $url');

                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            print("Could not launch $url");
                          }
                      },
                    ),
                  ),
                  SizedBox(height: 14,),
                  Material(
                    color: color_red,
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      title: const Text('#xyzbca', style: TextStyle(color: Colors.white)),
                      subtitle: Row(
                        children: [
                          Icon(Icons.videocam),
                          SizedBox(width: 4,),
                          const Text('304.6 Million', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                          SizedBox(width: 10),
                          Icon(Icons.remove_red_eye),
                          SizedBox(width: 4,),
                          const Text('Views: 4 Trillion', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                        ],
                      ),
                      onTap: () async {
                          LaunchUrlTiktok launcherTiktok = LaunchUrlTiktok(hashtagType: "foryou");
                          String url = await launcherTiktok.launchUrl();
                          print('check url lauch $url');

                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            print("Could not launch $url");
                          }
                      },
                    ),
                  ),
                
                
                
                
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



/* body: Center(
        child: Container(
          width: double.infinity,
          height: 55,
          color: Colors.grey, // Серый цвет контейнера
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  // Действие при нажатии на стрелку
                  // Например, переход на другую страницу
                },
                child: Icon(
                  Icons.arrow_forward,
                  color: color_red, // Красный цвет стрелки
                ),
              ),
            ],
          ),
        ),
      ), */