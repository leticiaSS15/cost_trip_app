import 'package:cost_trip/modelo/acomodacao.dart';
import 'package:cost_trip/modelo/transporte.dart';
import 'package:flutter/material.dart';

class Viajem {

  final String id;
  final String destino;
  final String roteiro;
  final String dataIda;
  final String dataVolta;
  final String horarioSaida;
  final String horarioVolta;
  final Transporte transporte;
  final Acomodacao acomodacao;
  final double gastos_previstos;

  Viajem(this.transporte, this.acomodacao,
      {required this.id,
      required this.destino,
      required this.roteiro,
      required this.dataIda,
      required this.dataVolta,
      required this.horarioSaida,
      required this.horarioVolta,
      required this.gastos_previstos,
      });
}