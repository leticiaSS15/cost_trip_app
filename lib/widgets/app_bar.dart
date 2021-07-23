import 'package:flutter/material.dart';

class AppBarViagem extends StatefulWidget {
  final String name_page;
  final double tamanho_fonte;
  final bool exibir_return;
  final bool exibir_perfil;

  const AppBarViagem({Key? key, required this.name_page, required this.tamanho_fonte, required this.exibir_return, required this.exibir_perfil}) : super(key: key);
  @override
  _AppBarViagemState createState() => _AppBarViagemState();
}

class _AppBarViagemState extends State<AppBarViagem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
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
          if (widget.exibir_perfil) Align(
           alignment: Alignment.topRight,
           child: IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/pagUsuário');
                },
                icon: Icon(Icons.account_circle),
                iconSize: 50.0,
                color: Colors.black,
              ),
         ),
          if (widget.exibir_return) Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              iconSize: 30.0,
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50.0, left: 20.0),
            padding: EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 90,
            ),
            child: Text('${widget.name_page}',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: widget.tamanho_fonte,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

