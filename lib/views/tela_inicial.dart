import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
          children: <Widget>[
            SizedBox(height: 170),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              child: Text("Nova Viajem",
              style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Colors.greenAccent,
              onPressed: (){},
              padding: EdgeInsets.symmetric(
                horizontal: 130.0,
                vertical: 25.0,
              ),
            ),
            SizedBox(height: 80),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Text("Minhas Viagens",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Colors.greenAccent,
              onPressed: (){},
              padding: EdgeInsets.symmetric(
                horizontal: 130.0,
                vertical: 25.0,
              ),
            ),
            SizedBox(height: 80),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Text("Histórico",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Colors.greenAccent,
              onPressed: (){},
              padding: EdgeInsets.symmetric(
                horizontal: 130.0,
                vertical: 25.0,
              ),
            ),
          ],
        ),
    );
  }
}
