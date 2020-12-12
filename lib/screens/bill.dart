import 'package:faturahesaplama/screens/fatura_detay.dart';
import 'package:faturahesaplama/services/advert-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bill extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BillState();
  }
}

class BillState extends State<Bill> {
  final TextEditingController t1 = new TextEditingController(text: "0");
  final TextEditingController t2 = new TextEditingController(text: "0");
  final TextEditingController t3 = new TextEditingController(text: "0");
  final TextEditingController t4 = new TextEditingController(text: "0");
  final TextEditingController t5 = new TextEditingController(text: "0");
  final AdvertService _advertService = AdvertService();

  double s1 = 0, s2 = 0, s3 = 0, s4 = 0, sonuc = 0, hesap = 0, s5 = 0;
  @override
  void initState() {
    _advertService.showBanner();
    _advertService.showIntersitial();
    super.initState();
  }
  void fatura() {
    setState(() {
      s1 = double.parse(t1.text);
      s2 = double.parse(t2.text);
      s3 = double.parse(t3.text);
      s4 = double.parse(t4.text);
      s5 = double.parse(t5.text);

      sonuc = double.parse(((s1 / (s3 - s2)) * (s4 - s3)).toStringAsFixed(2));

      if(s5==0){
        hesap=0;
      }else{
        hesap = double.parse(((sonuc / s5) * 30).toStringAsFixed(2));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fatura Hesaplama",
        ),
        backgroundColor: Colors.cyan,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.more_horiz),
            tooltip: 'Nasıl Çalışır',
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Detay()));

            },

          ),
        ],
      ),
      body: Container(
        //color: Colors.blueGrey,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Ödenen Son Faturanızı Giriniz (Örn 54.25) *',
                    icon: Icon(Icons.done_outline),
                    hintText: t1.text,
                    hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 10)),
                controller: t1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Son Fatura  İlk Endeks (Örn 7842) *',
                  icon: Icon(Icons.done_outline),
                  hintText: t2.text,
                  hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 10)),
              controller: t2,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Son Fatura  Son Endeks (Örn 7887) *',
                    icon: Icon(Icons.done_outline),
                    hintText: t3.text,
                    hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 10)),
                controller: t3,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Sayaçtan Okunan Değer (Örn 7933) *',
                    icon: Icon(Icons.done_outline),
                    hintText: t4.text,
                    hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 8)),
                controller: t4,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Son Faturanız üzerinden kaç gün geçti (Örn 8)',
                    icon: Icon(Icons.timer),
                    hintText: t5.text,
                    hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 8)),
                controller: t5,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Hesaplanan faturanız : $sonuc TL"),
            SizedBox(
              height: 5,
            ),
            Text("Ay sonu tahmini : $hesap TL"),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      fatura();
                    },
                    child: Text("Doğalgaz"),
                    color: Colors.cyan,
                  ),
                  RaisedButton(
                    onPressed: () {
                      fatura();
                    },
                    child: Text("Elektrik"),
                    color: Colors.limeAccent,
                  ),
                  RaisedButton(
                    onPressed: () {
                      fatura();
                    },
                    child: Text("Su"),
                    color: Colors.blue,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
