import 'package:cost_trip/views/tela_inicial.dart';
import 'package:cost_trip/widgets/app_bar.dart';
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
          AppBarViagem(name_page: "Bem Vindo!", tamanho_fonte: 30.0, exibir_return: false, exibir_perfil: true,),
          TelaInicial(),
        ],
      ),
    );
  }
}