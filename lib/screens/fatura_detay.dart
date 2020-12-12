import 'package:faturahesaplama/services/advert-service.dart';
import 'package:flutter/material.dart';

class Detay extends StatefulWidget {
  @override
  _DetayState createState() => _DetayState();
}

class _DetayState extends State<Detay> {
  final AdvertService _advertService = AdvertService();

  @override
  void setState(fn) {
    _advertService.showBanner();
    _advertService.showIntersitial();
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Nasıl Çalışır ? "),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage("assets/fatura.jpeg"),
              width: 400,
              height: 300,
            ),
            Image(
              image: AssetImage("assets/fatura1.jpeg"),
              width: 330,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
