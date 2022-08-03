import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hesapmakinesi/alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Basic Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Basic Calculator",
          ),
        ),
        body: AnaEkran(),
      ),
    );
  }
}

class AnaEkran extends StatefulWidget {
  AnaEkran({Key? key}) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  num? s1 = 0;
  num? s2 = 0;
  num? sonuc = 0;

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  plus() {
    setState(() {
      //TryPase null değer verebilir.
      s1 = num.tryParse(t1.text);
      s2 = num.tryParse(t2.text);
      if (s1 != null && s2 != null) {
        sonuc = s1! + s2!;
      } else {
        showAlertDialog(context);
      }
    });
  }

  minus() {
    setState(() {
      s1 = num.tryParse(t1.text);
      s2 = num.tryParse(t2.text);
      if (s1 != null && s2 != null) {
        sonuc = s1! - s2!;
      } else {
        showAlertDialog(context);
      }
    });
  }

  multiply() {
    setState(() {
      s1 = num.tryParse(t1.text);
      s2 = num.tryParse(t2.text);
      if (s1 != null && s2 != null) {
        sonuc = s1! / s2!;
      } else {
        showAlertDialog(context);
      }
    });
  }

  divide() {
    setState(() {
      s1 = num.tryParse(t1.text);
      s2 = num.tryParse(t2.text);
      if (s1 != null && s2 != null) {
        sonuc = s1! * s2!;
      } else {
        print("Error. Please enter number.");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Center(
        child: Column(
          children: [
            Text(
              "Result",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              sonuc.toString(),
              style: TextStyle(fontSize: 24),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Please enter fırst number",
                prefixIcon: Icon(Icons.ac_unit_sharp),
              ),
              controller: t1,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Please enter second number",
                  prefixIcon: Icon(Icons.ac_unit_sharp)),
              controller: t2,
            ),
            SizedBox(height: 30),
            CupertinoButton(
              onPressed: plus,
              child: Text(
                "Plus",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Colors.blue.shade400,
            ),
            SizedBox(height: 30),
            CupertinoButton(
              onPressed: minus,
              child: Text(
                "Minus",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Colors.blue.shade400,
            ),
            SizedBox(height: 30),
            CupertinoButton(
              onPressed: multiply,
              child: Text(
                "Multiply",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Colors.blue.shade400,
            ),
            SizedBox(height: 30),
            CupertinoButton(
              onPressed: divide,
              child: Text(
                "Divide",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Colors.blue.shade400,
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {},
  );

  CupertinoAlertDialog alert = CupertinoAlertDialog(
    title: Text("Error"),
    content: Text("Please enter the number"),
    actions: [CupertinoDialogAction(child: Text("ok"))],
  );

  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

  // set up the AlertDialog
  /* AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text("Please enter h."),
    actions: [
      okButton,
    ],
  );*/
}
