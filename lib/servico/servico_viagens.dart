import 'package:cost_trip/database/db_acomodacao.dart';
import 'package:cost_trip/database/db_transporte.dart';
import 'package:cost_trip/database/db_viagens.dart';
import 'package:cost_trip/modelo/acomodacao.dart';
import 'package:cost_trip/modelo/transporte.dart';
import 'package:cost_trip/modelo/viagem.dart';
import 'package:flutter/material.dart';

class ServicoViagem with ChangeNotifier {

  DbViagens _dbViagens = DbViagens();
  DbAcomodacao _dbAcomodacao = DbAcomodacao();
  DbTransporte _dbTransporte = DbTransporte();
  Acomodacao newAcomodacao = Acomodacao(id_acomodacao: '', custo_acomodacao: 0.0, custo_estacionamento: 0.0, seguro_local: 0.0, total_gastos_acomodacao: 0.0);


  Future<void> salvar(Map dados, Transporte transporte, Acomodacao acomodacao) async {

    final newAcomodacao = Acomodacao(
        id_acomodacao: '',
        custo_acomodacao: acomodacao.custo_acomodacao,
        custo_estacionamento: acomodacao.custo_estacionamento,
        seguro_local: acomodacao.seguro_local,
        total_gastos_acomodacao: acomodacao.total_gastos_acomodacao
    );

    await _dbAcomodacao.addAcomodacao(newAcomodacao);
    var id_acomodacao = _dbAcomodacao.id_acomodacao;

    final newTransporte = Transporte(
        id_transporte: '',
        custo_passagem: transporte.custo_passagem,
        custo_bagagem: transporte.custo_bagagem,
        seguro_viagem: transporte.seguro_viagem,
        total_gastos_transporte: transporte.total_gastos_transporte
    );

    await _dbTransporte.addTransporte(newTransporte);
    var id_transporte = _dbTransporte.id_transporte;

    final newViagem = Viagem(
        id_viagem: '',
        destino: dados['destino'],
        dataIda: dados['dataIda'],
        dataVolta: dados['dataVolta'],
        horarioIda: dados['horaIda'],
        horarioVolta: dados['horaVolta'],
        gastos_previstos: dados['gastos_previstos'],
        id_acomodacao: id_acomodacao.toString(),
        id_transporte: id_transporte.toString(),
    );


    _dbViagens.addViagem(newViagem);

  }

}