// ignore_for_file: prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '1main.dart';
//this file includes the wigdets that i used in application 
//MarketScreen
class ListTileExample extends StatelessWidget {
  final int id;
  final String aciklama;
  final String urunadi;
  final int stokMiktari;

  const ListTileExample({
    super.key,
    required this.urunadi,
    required this.id,
    required this.aciklama,
    required this.stokMiktari,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 500,
        height: 65,
        child: ListTile(
            style: ListTileStyle.list,
            contentPadding: const EdgeInsets.all(8),
            enabled: id == 0 ? false : true,
            title: Text(" $urunadi (Urun Kodu:$id)   Stok:$stokMiktari",
                style: GoogleFonts.libreFranklin()),
            tileColor: Color.fromARGB(255, 212, 255, 230),
            subtitle: Text(aciklama),

            //await conn.query('DELETE FROM "products"."products" WHERE qu > 5');
            trailing: ElevatedButton.icon(
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
                    return const Color.fromARGB(
                        255, 40, 177, 145); // Use the component's default.
                  },
                ),
              ),
              label: Text(id == 0 ? " " : "delete"),
              key: GlobalKey(),
              onPressed: deleteProduct,
              icon: Icon(
                id == 0 ? Icons.block : Icons.delete,
              ),
            )));
  }

  void deleteProduct() {
    userlistesi[id - 1] = {
      "marka": " ",
      "id": 0,
      "aciklama": " ",
      "stokmiktari": 0,
    };
  }
}

//EnteranceSCreen
class TextFieldExample extends StatelessWidget {
  final String text;
  const TextFieldExample({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {},
      decoration: InputDecoration(
        border: InputBorder.none,
        //labelText: '$text ',
        hintText: '$text ',
      ),
    );
  }
}

//SearchSceen
class TextFieldExamples extends StatefulWidget {
  const TextFieldExamples({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  State<TextFieldExamples> createState() => TextFieldExamplesub();
}

//SearchSceen
class TextFieldExamplesub extends State<TextFieldExamples> {
  
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: false,
      slivers: <Widget>[
        SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Expanded(
                    flex: 0,
                    //Update   await conn.query('UPDATE "products"."products" SET amount = 200  WHERE qu = 2');

                    child: TextField(
                      onSubmitted: (value) {
                        setState(() {
                          i = int.parse(value);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('System is bringing information... '),
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: "Urun id giriniz",
                      ),
                    ),
                  ),
                  const Divider(
                    height: 40,
                  ),
                  
                  Container(
                    alignment: Alignment.center,
                    child: Text("Girmiş Olduğunuz İd'li Ürününü Markası: " +
                        userlistesi[i - 1]["marka"]),
                  ),
                  const Divider(
                    height: 20,
                  ),
                  TextField(
                      onSubmitted: (value) {
                        setState(() {
                          userlistesi[i - 1]["marka"] = value;
                          /* Update
  await conn.query('UPDATE "products"."products" SET amount = 200  WHERE qu = 2');
  */
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data has been saved'),
                          ),
                        );
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          label: const Text("Urunun yeni markasini giriniz"),
                          alignLabelWithHint: true)),
                  const Divider(
                    height: 40,
                  ),
                  //var results = await conn.query('SELECT* FROM "products"."products"');
                  //print(results[4][3]);
                  Container(
                    alignment: Alignment.center,
                    child: Text("Girmiş Olduğunuz İd'li Ürününü Açıklaması: " +
                        userlistesi[i - 1]["aciklama"]),
                  ),
                  const Divider(
                    height: 20,
                  ),
                  TextField(
                      onSubmitted: (value) {
                        setState(() {
                          userlistesi[i - 1]["aciklama"] = value;
                          /* Update
  await conn.query('UPDATE "products"."products" SET amount = 200  WHERE qu = 2');
  */
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data has been saved'),
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text("Urunun yeni aciklamasini giriniz"),
                        alignLabelWithHint: true,
                      )),
                  const Divider(
                    height: 40,
                  ),
                  //var results = await conn.query('SELECT* FROM "products"."products"');
                  //print(results[4][3]);
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                          "Girmiş Olduğunuz İd'li Ürününü Stok Miktarı: ${userlistesi[i - 1]["stokmiktari"]}")),
                  const Divider(
                    height: 20,
                  ),
                  TextField(
                      controller: myController9,
                      onSubmitted: (value) {
                        setState(() {
                          userlistesi[i - 1]["stokmiktari"] =
                              int.tryParse(value);
                          /* Update
  await conn.query('UPDATE "products"."products" SET amount = 200  WHERE qu = 2');
  */
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data has been saved'),
                            ),
                          );
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          label:
                              const Text("Urunun yeni stokmiktarini giriniz"),
                          alignLabelWithHint: true)),
                ],
              ),
            ))
      ],
    );
  }
}
