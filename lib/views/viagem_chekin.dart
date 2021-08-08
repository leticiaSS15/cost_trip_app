import 'package:cost_trip/provider/provider_viagens.dart';
import 'package:cost_trip/widgets/app_bar.dart';
import 'package:cost_trip/widgets/card_viagem.dart';
import 'package:flutter/material.dart';

class ViagemCheckin extends StatefulWidget {
  @override
  _ViagemCheckinState createState() => _ViagemCheckinState();
}

class _ViagemCheckinState extends State<ViagemCheckin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBarViagem(name_page: "Viagens com Check-In", tamanho_fonte: 18.0, exibir_return: true, exibir_perfil: true,),
          Padding(
            padding: const EdgeInsets.only(top: 200.0, left: 5, right: 5),
            child: ProviderViagens(rota: 'checkin'),
          ),
        ],
      ),
    );
  }
}
