import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_15102/1main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widget.dart';
import 'package:postgres/postgres.dart';
import '1main.dart';

void sayhi() {
  print("hi");
}

class MarketScreenState extends StatefulWidget {
  const MarketScreenState({
    Key? key,
  }) : super(key: key);
  @override
  State<MarketScreenState> createState() => MarketScreen();
}

class MarketScreen extends State<MarketScreenState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 40, 177, 145),
        title: Text(
          'List of Market Products',
          style: GoogleFonts.lato(textStyle: TextStyle(letterSpacing: .2)),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      //bottomNavigationBar:,
      //endDrawer:
      //floatingActionButton:Container(color:Colors.black,width: 50,height: 50,),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      //extendBody: true,
      /*
      persistentFooterButtons: [
        Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
                onPressed: sayhi,
                icon: Icon(Icons.check_box),
                label: Text("hi")),
            TextButton.icon(
                onPressed: sayhi,
                icon: Icon(Icons.check_box),
                label: Text("hi")),
            TextButton.icon(
                onPressed: sayhi,
                icon: Icon(Icons.check_box),
                label: Text("hi")),
            TextButton.icon(
                onPressed: sayhi,
                icon: Icon(Icons.check_box),
                label: Text("hi")),
          ],
        )
      ],*/

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 40, 177, 145),
              ),
              child: Text(
                'Information About List of Market Products Screen',
                style: GoogleFonts.notoSerif(fontSize: 28, color: Colors.white),
                textAlign: TextAlign.right,
              ),
            ),
            ListTile(
              title: Text(
                'This screen shows products that market has.\n\nEach products has a specific id number, name of product, a description, amonut of stock.\n\nClicking on "delete" button, you can delete products. \n\nIn order to see new list of produts after deleting process, you must press refresh button.',
                style: GoogleFonts.manrope(fontSize: 20, wordSpacing: .1),
                textAlign: TextAlign.left,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Color.fromARGB(255, 17, 81, 66)
                                /*Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(1)*/
                                ;
                          }
                          return const Color.fromARGB(255, 40, 177,
                              145); // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () async {
                      final conn = PostgreSQLConnection(
                          '10.7.85.219', 5432, 'products',
                          username: 'postgres', password: '');
                      await conn.open();
                      var results = await conn
                          .query('SELECT* FROM "products"."products"');
                      print(results[0][0]);

                      setState(() {
                        for (i = 0; i < userlistesi.length; i++) {
                          ListTileExample(
                            id: results[0][3],
                            aciklama: results[0][0],
                            urunadi: results[0][1],
                            stokMiktari: results[0][2],
                            key: GlobalKey(),
                          );
                        }
                      });
                    },
                    child: Text(
                      "Click To Refresh List",
                      style: GoogleFonts.lato(fontSize: 18, wordSpacing: .5),
                    ),
                  ),
                  for (i = 0; i < userlistesi.length; i++)
                    ListTileExample(
                      id: userlistesi[i]['id'],
                      aciklama: userlistesi[i]['aciklama'],
                      urunadi: userlistesi[i]['marka'],
                      stokMiktari: userlistesi[i]['stokmiktari'],
                      key: GlobalKey(),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void yenile() {
    MaterialPageRoute(
        builder: (context) => const MyHomePage(
              title: "hi",
            ));
  }
}
