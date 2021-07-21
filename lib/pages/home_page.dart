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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.account_circle),
              iconSize: 50.0,
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100.0, left: 20.0),
            padding: EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 90,
            ),
            child: Text('Bem Vindo',
              style: TextStyle(
                fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30,
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