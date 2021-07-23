import 'package:cost_trip/widgets/app_bar.dart';
import 'package:cost_trip/widgets/card_viagem.dart';
import 'package:flutter/material.dart';

class ViagemPlanejada extends StatefulWidget {
  @override
  _ViagemPlanejadaState createState() => _ViagemPlanejadaState();
}

class _ViagemPlanejadaState extends State<ViagemPlanejada> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBarViagem(name_page: 'Viagens Planejadas', tamanho_fonte: 18.0, tipo_page: false,),
          Card(
              margin: EdgeInsets.symmetric(
                vertical: 290,
                horizontal: 10,
              ),
              child: CardViewViagem()
          ),
        ],
      ),
    );
  }
}
