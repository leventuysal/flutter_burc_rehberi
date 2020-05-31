import 'package:flutter/material.dart';
import 'package:flutterburcrehberi/burc_detay.dart';
import 'package:flutterburcrehberi/burc_liste.dart';
import 'palette_generator.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Burç Rehberi",
      debugShowCheckedModeBanner: false,
      initialRoute: "/burclistesi",
      routes: {
        "/": (context) => BurcListesi(),
        "/burclistesi": (context) => BurcListesi(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElemanlari = settings.name.split("/");
        if (pathElemanlari[1] == "burcdetay")
          {
            return MaterialPageRoute(builder: (context)=> BurcDetay(int.parse(pathElemanlari[2])));
          }
        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      //home: BurcListesi(),
    );
  }
}
