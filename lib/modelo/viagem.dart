import 'package:flutter/material.dart';

class Viagem {

  final String id;
  final String destino;
  final String roteiro;
  final String data;
  final String horariosaida;
  final String horariochegada;
  final String transporte;
  final String acomodacao;
  final double gastos_previstos;

  Viagem(this.id, this.destino, this.roteiro, this.data, this.horariosaida, this.horariochegada, this.transporte, this.acomodacao, this.gastos_previstos);


}