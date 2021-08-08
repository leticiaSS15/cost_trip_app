import 'package:cost_trip/modelo/acomodacao.dart';
import 'package:cost_trip/modelo/transporte.dart';
import 'package:flutter/material.dart';

class Viajem with ChangeNotifier {

  final String id;
  final String destino;
  final String dataIda;
  final String dataVolta;
  final String horarioIda;
  final String horarioVolta;
  //final Transporte transporte;
  //final Acomodacao acomodacao;
  final double gastos_previstos;

  Viajem(
      {required this.id,
      required this.destino,
      required this.dataIda,
      required this.dataVolta,
      required this.horarioIda,
      required this.horarioVolta,
      required this.gastos_previstos,
      });

  /*Map<String, dynamic> toMap(){
    return {
      'destino': this.destino,
      'dataIda': this.dataIda,
      'dataVolta': this.dataVolta,
      'horarioIda': this.horarioIda,
      'horarioVolta': this.horarioVolta,
      'transporte': this.transporte,
      'acomodacao': this.acomodacao,
      'gastos_previstos': this.gastos_previstos,
    };*/
  //}
}