import 'package:flutter/material.dart';
import 'package:flutter_application_15102/3Kindodemo.dart';
import 'package:flutter_application_15102/widgetlibrary.dart';
import 'widgetlibrary.dart';

class EntranceScreen extends StatelessWidget {
  const EntranceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        /*image: const DecorationImage(
          image: NetworkImage(
              'https://images.unsplash.com/photo-1604719312566-8912e9227c6a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fG1hcmtldHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
          fit: BoxFit.cover,
        ),*/
      ),
      child: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 480 - 250,
              left: 40,
              right: 40,
              height: 75,
              child: Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.topRight,
                  width: 350,
                  height: 70,
                  color: Colors.black45,
                  child: const Text(
                    "Market Stock System",
                    style: TextStyle(color: Colors.white, fontSize: 48),
                  )),
            ),
            Positioned(
              bottom: 375 - 200,
              left: 25,
              right: 25,
              height: 50,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.topRight,
                width: 350,
                height: 110,
                color: Colors.white,
                child: const TextFieldExample(text: "Kullanici adi"),
              ),
            ),
            Positioned(
              bottom: 300 - 200,
              left: 25,
              right: 25,
              height: 50,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.topRight,
                width: 350,
                height: 70,
                color: Colors.white,
                child: const TextFieldExample(text: "Sifre"),
              ),
            ),
            Positioned(
              bottom: 225 - 200,
              left: 260,
              right: 25,
              height: 50,
              child: Container(
                padding: const EdgeInsets.all(0),
                alignment: Alignment.topRight,
                width: 150,
                height: 70,
                color: Colors.white,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const KindoDemoScreen(
                                  title: 'A',
                                )),
                      );
                    },
                    child: const Text("Enter System")),
              ),
            ),
            Positioned(
              bottom: 250 - 200,
              left: 25,
              right: 250,
              height: 25,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.topRight,
                width: 150,
                height: 70,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
