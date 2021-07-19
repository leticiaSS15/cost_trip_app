import 'package:cost_trip/views/tela_inicial.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            padding: EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 90,
            ),
            child: Text('Bem Vindo',
              style: TextStyle(
                fontSize: 45,
                fontFamily: 'Anton',
              ),
            ),
          ),
          Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 60, 255, 0.5),
                Color.fromRGBO(0, 188, 117, 0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
          TelaInicial(),
        ],
      ),
    );
  }
}


/*       appBar: AppBar(
        title: Text('Bem vindo!'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.account_circle))
        ],
      ),*/