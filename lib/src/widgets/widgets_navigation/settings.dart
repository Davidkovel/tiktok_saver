import 'package:flutter/material.dart';
import '../style.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 140, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 18, color: Colors.white),
                
                children: [
                  TextSpan(
                    text: "Enjoy the app!\n",
                    style: TextStyle(fontSize: 26),
                  ),
                  TextSpan(
                    text: "Save and download Videos with no limits",
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Handle Rate us button press
              },
              child: Container(
                width: double.infinity, // Растягиваем кнопку на всю ширину
                height: 15,
                alignment: Alignment.center, // Выравниваем текст по центру
                child: Text(
                  'Rate us',
                  style: TextStyle(color: Colors.white), // Цвет текста (белый)
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xffea2d4d), // Цвет фона кнопки (красный)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                    color: Color.fromARGB(255, 84, 66, 66),
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: -2.5),
                      title: const Text('Restore purchases', style: TextStyle(color: Colors.white)),
                      onTap: () async {},
                    ),
                  ),
                SizedBox(height: 10),
                Material(
                    color: Color.fromARGB(255, 84, 66, 66),
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: -2.5),
                      title: const Text('Contact/Support', style: TextStyle(color: Colors.white)),
                      onTap: () async {},
                    ),
                  ),
                SizedBox(height: 10),
                Material(
                    color: Color.fromARGB(255, 84, 66, 66),
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: -2.5),
                      title: const Text('Video Tutorial', style: TextStyle(color: Colors.white)),
                      onTap: () async {},
                    ),
                  ),
                SizedBox(height: 10),
                Material(
                    color: Color.fromARGB(255, 84, 66, 66),
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: -2.5),
                      title: const Text('Privacy Policy', style: TextStyle(color: Colors.white)),
                      onTap: () async {},
                    ),
                  ),
                SizedBox(height: 10),
                Material(
                    color: Color.fromARGB(255, 84, 66, 66),
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      visualDensity: VisualDensity(vertical: -2.5),
                      title: const Text('Terms of Use', style: TextStyle(color: Colors.white)),
                      onTap: () async {},
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.bottomLeft, // Переместите текст вниз
              child: Text(
                "TikSaver Pro is not affiliated with TikTok or ByteDance Ltd.",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
