import 'package:cost_trip/database/db_acomodacao.dart';
import 'package:cost_trip/database/db_satisfacao.dart';
import 'package:cost_trip/database/db_transporte.dart';
import 'package:cost_trip/database/db_viagens.dart';
import 'package:cost_trip/modelo/acomodacao.dart';
import 'package:cost_trip/modelo/satisfacao.dart';
import 'package:cost_trip/modelo/transporte.dart';
import 'package:cost_trip/modelo/viagem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServicoViagem with ChangeNotifier {

  DbViagens _dbViagens = DbViagens();
  DbAcomodacao _dbAcomodacao = DbAcomodacao();
  DbTransporte _dbTransporte = DbTransporte();
  DbSatisfacao _dbSatisfacao = DbSatisfacao();
  Acomodacao newAcomodacao = Acomodacao(id_acomodacao: '', custo_acomodacao: 0.0, custo_estacionamento: 0.0, seguro_local: 0.0, total_gastos_acomodacao: 0.0);


  Future<void> salvarViagem(Map dados, Transporte transporte, Acomodacao acomodacao, String roteiro) async {

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

    if(roteiro.isEmpty){
      roteiro = 'Nenhum roteiro cadastrado';
    }

    final newViagem = Viagem(
      id_viagem: '',
      destino: dados['destino'],
      dataIda: dados['dataIda'],
      dataVolta: dados['dataVolta'],
      horarioIda: dados['horaIda'],
      horarioVolta: dados['horaVolta'],
      roteiro: roteiro,
      gastos_previstos: dados['gastos_previstos'],
      gastos_extras: 0.0,
      id_acomodacao: id_acomodacao.toString(),
      id_transporte: id_transporte.toString(),
    );
    _dbViagens.addViagem(newViagem);

  }

  Future<void> updateViagem(Viagem viagem, Map formEdicao) async {

    final newViagem = Viagem(
      id_viagem: viagem.id_viagem,
      destino: formEdicao['destino'],
      dataIda: formEdicao['dataIda'],
      dataVolta: formEdicao['dataVolta'],
      horarioIda: formEdicao['horaIda'],
      horarioVolta: formEdicao['horaVolta'],
      roteiro: viagem.roteiro,
      gastos_previstos: formEdicao['gastos_previstos'],
      gastos_extras: viagem.gastos_extras,
      id_acomodacao: viagem.id_acomodacao,
      id_transporte: viagem.id_transporte,
    );
    await _dbViagens.loadViagem();
    _dbViagens.updateViagem(newViagem);
  }

  Future<void> deletarViagem(Viagem viagem, context) async {

    Provider.of<DbViagens>(context, listen: false).deleteViagem(viagem.id_viagem);
    Provider.of<DbAcomodacao>(context, listen: false).deleteAcomodacao(viagem.id_acomodacao);
    Provider.of<DbTransporte>(context, listen: false).deleteTransporte(viagem.id_transporte);

  }

  Future<void> pesqSatisfacao(bool updateOp) async {
    String id = '-Mi8NCf_tKF-zXJUGtm6';

    await _dbSatisfacao.loadOpniao(id);
    var newOpniao = _dbSatisfacao.pesq;
    if(updateOp){
      _dbSatisfacao.updateBoasViagens(newOpniao);
    } else {
      _dbSatisfacao.updateMasViagens(newOpniao);
    }

  }


}