import 'dart:convert';
import 'dart:math';
import 'package:cost_trip/modelo/viagem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DbViagens with ChangeNotifier {

  Uri _baseUrl = Uri.parse('https://costtrip-dec61-default-rtdb.firebaseio.com/viagens.json');

  List<Viajem> _viagens = [];

  List<Viajem> get viagens => [ ..._viagens];

  int get itemsCount {
    return _viagens.length;
  }

  Future<void> addViagem(Viajem newViagem) async {
    final response = await http.post(
      _baseUrl,
      body: json.encode({
        'destino': newViagem.destino,
        'dataIda': newViagem.dataIda,
        'dataVolta': newViagem.dataVolta,
        'horarioIda': newViagem.horarioIda,
        'horarioVolta': newViagem.horarioVolta,
        //'transporte': newViagem.transporte,
        //'acomodacao': newViagem.acomodacao,
        'gastos_previstos': newViagem.gastos_previstos,
      })
    );
      _viagens.add(Viajem(
          //newViagem.transporte,
          //newViagem.acomodacao,
          id: json.decode(response.body)['name'],
          destino: newViagem.destino,
          dataIda: newViagem.dataIda,
          dataVolta: newViagem.dataVolta,
          horarioIda: newViagem.horarioIda,
          horarioVolta: newViagem.horarioVolta,
          gastos_previstos: newViagem.gastos_previstos
      ));
      notifyListeners();
  }

  Future<void> updateViagem(Viajem oldViagem) async {
    if(oldViagem == null || oldViagem.id == null) {
      return;
    }

    final index = _viagens.indexWhere((trip) => trip.id == oldViagem.id);
    Uri _editUrl = Uri.parse('https://costtrip-dec61-default-rtdb.firebaseio.com/viagens/${oldViagem.id}.json');

    if(index >= 0){
      await http.patch(
          _editUrl,
          body: json.encode({
            'destino': oldViagem.destino,
            'dataIda': oldViagem.dataIda,
            'dataVolta': oldViagem.dataVolta,
            'horarioIda': oldViagem.horarioIda,
            'horarioVolta': oldViagem.horarioVolta,
            //'transporte': newViagem.transporte,
            //'acomodacao': newViagem.acomodacao,
            'gastos_previstos': oldViagem.gastos_previstos,
          })
      );
      _viagens[index] = oldViagem;
      notifyListeners();
    }
  }

  Future<void> loadViagem() async{
    final response = await http.get(_baseUrl);
    print(json.decode(response.body));
    Map<String, dynamic> dados = json.decode(response.body);
    _viagens.clear();
    //print(json.decode(response.body));
    if(dados != null){
      dados.forEach((viagemId, viagemData) {
        _viagens.add(Viajem(
            id: viagemId,
            destino: viagemData['destino'],
            dataIda: viagemData['dataIda'],
            dataVolta: viagemData['dataVolta'],
            horarioIda: viagemData['horarioIda'],
            horarioVolta: viagemData['horarioVolta'],
            gastos_previstos: viagemData['gastos_previstos'])
        );
      });
      notifyListeners();
    }
    return Future.value();
  }
  
  Future<void> deleteViagem(String id) async {
    final index = _viagens.indexWhere((trip) => trip.id == id);

    if(index >= 0){
      final viagem = _viagens[index];
      Uri _editUrl = Uri.parse('https://costtrip-dec61-default-rtdb.firebaseio.com/viagens/${viagem.id}.json');
      _viagens.remove(viagem);
      notifyListeners();

      final response = await http.delete(_editUrl);

      if (response.statusCode >= 400){
        _viagens.insert(index, viagem);
        notifyListeners();
      }
    }
  }
}