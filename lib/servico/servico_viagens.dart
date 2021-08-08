import 'dart:math';
import 'package:cost_trip/database/db_viagens.dart';
import 'package:cost_trip/modelo/acomodacao.dart';
import 'package:cost_trip/modelo/transporte.dart';
import 'package:cost_trip/modelo/viagem.dart';
import 'package:flutter/material.dart';

class ServicoViagem with ChangeNotifier {

  DbViagens _dbViagens = DbViagens();

  void salvar(Map dados, Transporte transporte, Acomodacao acomodacao){
    final newViagem = Viajem(
        id: '',
        destino: dados['destino'],
        dataIda: dados['dataIda'],
        dataVolta: dados['dataVolta'],
        horarioIda: dados['horaIda'],
        horarioVolta: dados['horaVolta'],
        gastos_previstos: dados['gastos_previstos']
    );
    _dbViagens.addViagem(newViagem);
  }




}