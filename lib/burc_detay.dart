import 'package:flutter/material.dart';
import 'package:flutterburcrehberi/burc_liste.dart';

import 'models/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  int gelenIndex;

  BurcDetay(this.gelenIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color baskinRenk;
  Color baskinAltRenk;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secilenBurc = BurcListesi.tumBurclar[widget.gelenIndex];
    baskinRengiBul();
  }

  void baskinRengiBul() {
    Future<PaletteGenerator> futurePaletteGenerator =
        PaletteGenerator.fromImageProvider(
            AssetImage("images/" + secilenBurc.burcBuyukResim));
    futurePaletteGenerator.then((value) {
      paletteGenerator = value;

      //debugPrint("domainan renk:" + paletteGenerator.dominantColor.toString());
      setState(() {
        baskinRenk = paletteGenerator.dominantColor.color;
        baskinAltRenk = paletteGenerator.lightMutedColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: baskinRenk != null ? baskinRenk : Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(secilenBurc.burcAdi + " Burcu Özellikleri"),
              centerTitle: true,
              background: Image.asset(
                "images/${secilenBurc.burcBuyukResim}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: baskinAltRenk != null ? baskinAltRenk : Colors.pink.shade50,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              //color: Colors.pink.shade100,
              child: SingleChildScrollView(
                child: Text(
                  secilenBurc.burcDetayi,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
