import 'package:flutter/material.dart';


class Acomodacao with ChangeNotifier {

  final String id_acomodacao;
  final double custo_acomodacao;
  final double custo_estacionamento;
  final double seguro_local;
  final double total_gastos_acomodacao;

  Acomodacao({
    required this.id_acomodacao,
    required this.custo_acomodacao,
    required this.custo_estacionamento,
    required this.seguro_local,
    required this.total_gastos_acomodacao
  });


}