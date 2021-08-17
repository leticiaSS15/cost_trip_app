import 'package:cost_trip/database/db_acomodacao.dart';
import 'package:cost_trip/database/db_viagens.dart';
import 'package:cost_trip/modelo/viagem.dart';
import 'package:cost_trip/widgets/card_viagem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderCheckIN extends StatelessWidget{
  final String rota;
  final bool checkIN;

  const ProviderCheckIN({Key? key, required this.rota, required this.checkIN}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final viagensProvider = Provider.of<DbViagens>(context);
    final viagem = viagensProvider.viagensCheckIN;
    return ListView.builder(
        itemCount: viagem.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: viagem[i],
          child: CardViewViagem(rota: rota),
        )
    );
  }
}