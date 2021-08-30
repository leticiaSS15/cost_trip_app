import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Viagem with ChangeNotifier {

  final String id_viagem;
  final String destino;
  final String dataIda;
  final String dataVolta;
  final String horarioIda;
  final String horarioVolta;
  final String id_transporte;
  final String id_acomodacao;
  final String roteiro;
  bool check_in;
  bool check_out;
  final double gastos_previstos;
  final double gastos_extras;

  Viagem({
    required this.id_viagem,
    required this.destino,
    required this.dataIda,
    required this.dataVolta,
    required this.horarioIda,
    required this.horarioVolta,
    required this.roteiro,
    required this.id_transporte,
    required this.id_acomodacao,
    this.check_in = false,
    this.check_out = false,
    required this.gastos_previstos,
    required this.gastos_extras
  });

  void makeChek_in(){
    check_in = !check_in;
    notifyListeners();
  }
  void makeChek_out(){
    check_out = !check_out;
    notifyListeners();
  }

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