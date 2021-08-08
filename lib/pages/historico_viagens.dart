import 'package:cost_trip/provider/provider_viagens.dart';
import 'package:cost_trip/widgets/app_bar.dart';
import 'package:cost_trip/widgets/card_viagem.dart';
import 'package:flutter/material.dart';

class HistoricoViagens extends StatefulWidget {
  @override
  _HistoricoViagensState createState() => _HistoricoViagensState();
}

class _HistoricoViagensState extends State<HistoricoViagens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBarViagem(name_page: 'Histórico de Viagens', tamanho_fonte: 20.0, exibir_return: true, exibir_perfil: true,),
          Padding(
            padding: const EdgeInsets.only(top: 200.0, left: 5, right: 5),
            child: ProviderViagens(rota: 'historico',),
          ),
        ],
      ),
    );
  }
}

