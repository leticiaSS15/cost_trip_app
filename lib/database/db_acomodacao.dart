import 'dart:convert';
import 'package:cost_trip/modelo/acomodacao.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DbAcomodacao with ChangeNotifier {

  String id_acomodacao = '';

  Uri _baseUrl = Uri.parse('https://costtrip-dec61-default-rtdb.firebaseio.com/acomodacao.json');

  List<Acomodacao> _acomodacao = [];

  List<Acomodacao> get acomodacao => [ ..._acomodacao];

  Acomodacao newAcomodacao = Acomodacao(id_acomodacao: '', custo_acomodacao: 0.0, custo_estacionamento: 0.0, seguro_local: 0.0, total_gastos_acomodacao: 100.0);

  int get itemsCount {
    return _acomodacao.length;
  }


  Future<void> addAcomodacao(Acomodacao newAcomodacao) async {
    final response = await http.post(
        _baseUrl,
        body: json.encode({
          'custo_acomodacao': newAcomodacao.custo_acomodacao,
          'custo_estacionamento': newAcomodacao.custo_estacionamento,
          'seguro_local': newAcomodacao.seguro_local,
          'total_gastos_acomodacao': newAcomodacao.total_gastos_acomodacao,
        })
    );
    _acomodacao.add(Acomodacao(
        id_acomodacao: json.decode(response.body)['name'],
        custo_acomodacao: newAcomodacao.custo_acomodacao,
        custo_estacionamento: newAcomodacao.custo_estacionamento,
        seguro_local: newAcomodacao.seguro_local,
        total_gastos_acomodacao: newAcomodacao.total_gastos_acomodacao));

    id_acomodacao = json.decode(response.body)['name'].toString();
    print(json.decode(response.body)['name'].toString());
    notifyListeners();
  }

  Future<void> updateAcomodacao(Acomodacao acomodacao) async {
    if(acomodacao == null || acomodacao.id_acomodacao == null) {
      return;
    }

    final index = _acomodacao.indexWhere((acomod) => acomod.id_acomodacao == acomodacao.id_acomodacao);
    Uri _editUrl = Uri.parse('https://costtrip-dec61-default-rtdb.firebaseio.com/viagens/${acomodacao.id_acomodacao}.json');

    if(index >= 0){
      await http.patch(
          _editUrl,
          body: json.encode({
            'custo_acomodacao': acomodacao.custo_acomodacao,
            'custo_estacionamento': acomodacao.custo_estacionamento,
            'seguro_local': acomodacao.seguro_local,
            'total_gastos_acomodacao': acomodacao.total_gastos_acomodacao,
          })
      );
      _acomodacao[index] = acomodacao;
      notifyListeners();
    }
  }

  Future<void> loadAcomodacao(String idAcomodacao) async {

    final response = await http.get(_baseUrl);
    Map<String, dynamic> dados = json.decode(response.body);
    _acomodacao.clear();

    dados.forEach((acomodId, acomodData) {
      if(acomodId == idAcomodacao){
        newAcomodacao = Acomodacao(
            id_acomodacao: acomodId,
            custo_acomodacao: acomodData['custo_acomodacao'],
            custo_estacionamento: acomodData['custo_estacionamento'],
            seguro_local: acomodData['seguro_local'],
            total_gastos_acomodacao: acomodData['total_gastos_acomodacao']);
      }
    });
    notifyListeners();
    return Future.value();
  }

  Future<void> loadAllAcomodacao() async {

    final response = await http.get(_baseUrl);
    Map<String, dynamic> dados = json.decode(response.body);
    _acomodacao.clear();
    if(dados != null){
      dados.forEach((viagemId, viagemData) {
        _acomodacao.add(Acomodacao(
            id_acomodacao: viagemId,
            custo_acomodacao: viagemData['custo_acomodacao'],
            custo_estacionamento: viagemData['custo_estacionamento'],
            seguro_local: viagemData['seguro_local'],
            total_gastos_acomodacao: viagemData['total_gastos_acomodacao'])
        );
      });
      notifyListeners();
    }
    return Future.value();
  }


  Future<void> deleteAcomodacao(String id) async {
    final index = _acomodacao.indexWhere((acomod) => acomod.id_acomodacao == id);

    if(index >= 0){
      final acomodacao = _acomodacao[index];
      Uri _editUrl = Uri.parse('https://costtrip-dec61-default-rtdb.firebaseio.com/viagens/${acomodacao.id_acomodacao}.json');
      _acomodacao.remove(acomodacao);
      notifyListeners();

      final response = await http.delete(_editUrl);

      if (response.statusCode >= 400){
        _acomodacao.insert(index, acomodacao);
        notifyListeners();
      }
    }
  }


}