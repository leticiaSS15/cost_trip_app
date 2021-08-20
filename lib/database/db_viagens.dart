import 'dart:convert';
import 'package:cost_trip/database/db_acomodacao.dart';
import 'package:cost_trip/database/db_transporte.dart';
import 'package:cost_trip/modelo/viagem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DbViagens with ChangeNotifier {

  DbAcomodacao _dbAcomodacao = DbAcomodacao();
  DbTransporte _dbTransporte = DbTransporte();

  Uri _baseUrl = Uri.parse('https://costtrip-dec61-default-rtdb.firebaseio.com/viagens.json');

  List<Viagem> _viagens = [];

  List<Viagem> get viagens => [ ..._viagens];

  List<Viagem> get allViagens {
    return _viagens.where((trip) => !trip.check_in && !trip.check_out).toList();
  }

  List<Viagem> get viagensCheckIN {
    return _viagens.where((trip) => trip.check_in && !trip.check_out).toList();
  }

  List<Viagem> get viagensHistorico {
    return _viagens.where((trip) => trip.check_in && trip.check_out).toList();
  }

  int get itemsCount {
    return _viagens.length;
  }


  Future<void> addViagem(Viagem newViagem) async {
    final response = await http.post(
      _baseUrl,
      body: json.encode({
        'destino': newViagem.destino,
        'dataIda': newViagem.dataIda,
        'dataVolta': newViagem.dataVolta,
        'horarioIda': newViagem.horarioIda,
        'horarioVolta': newViagem.horarioVolta,
        'check_in': newViagem.check_in,
        'check_out': newViagem.check_out,
        'gastos_previstos': newViagem.gastos_previstos,
        'id_transporte': newViagem.id_transporte,
        'id_acomodacao': newViagem.id_acomodacao,
      })
    );
      _viagens.add(Viagem(
          id_viagem: json.decode(response.body)['name'],
          destino: newViagem.destino,
          dataIda: newViagem.dataIda,
          dataVolta: newViagem.dataVolta,
          horarioIda: newViagem.horarioIda,
          horarioVolta: newViagem.horarioVolta,
          check_in: newViagem.check_in,
          check_out: newViagem.check_out,
          gastos_previstos: newViagem.gastos_previstos,
          id_transporte: newViagem.id_transporte,
          id_acomodacao: newViagem.id_acomodacao,
      ));
      notifyListeners();
  }

  Future<void> updateViagem(Viagem oldViagem) async {

    print(oldViagem.id_viagem);
    print(oldViagem.destino);
    print(_viagens);

    final index = _viagens.indexWhere((trip) => trip.id_viagem == oldViagem.id_viagem);
    Uri _editUrl = Uri.parse('https://costtrip-dec61-default-rtdb.firebaseio.com/viagens/${oldViagem.id_viagem}.json');


    print(index);

    if(index >= 0){
      await http.patch(
          _editUrl,
          body: json.encode({
            'destino': oldViagem.destino,
            'dataIda': oldViagem.dataIda,
            'dataVolta': oldViagem.dataVolta,
            'horarioIda': oldViagem.horarioIda,
            'horarioVolta': oldViagem.horarioVolta,
            'id_transporte': oldViagem.id_transporte,
            'id_acomodacao': oldViagem.id_acomodacao,
            'check_in': oldViagem.check_in,
            'check_out': oldViagem.check_out,
            'gastos_previstos': oldViagem.gastos_previstos,
          })
      );
      _viagens[index] = oldViagem;
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> loadViagem() async {
    final response = await http.get(_baseUrl);
    //print(json.decode(response.body));
    Map<String, dynamic> dados = json.decode(response.body);
    _viagens.clear();
    //print(json.decode(response.body));
    if(dados != null){
      dados.forEach((viagemId, viagemData) {
        _viagens.add(Viagem(
            id_viagem: viagemId,
            destino: viagemData['destino'],
            dataIda: viagemData['dataIda'],
            dataVolta: viagemData['dataVolta'],
            horarioIda: viagemData['horarioIda'],
            horarioVolta: viagemData['horarioVolta'],
            check_in: viagemData['check_in'],
            check_out: viagemData['check_out'],
            gastos_previstos: viagemData['gastos_previstos'],
            id_transporte: viagemData['id_transporte'].toString(),
            id_acomodacao: viagemData['id_acomodacao'].toString())
        );
      });
      notifyListeners();
    }
    return Future.value();
  }
  
  Future<void> deleteViagem(String id) async {

    final index = _viagens.indexWhere((trip) => trip.id_viagem == id);

    print('DELETE VIAGEM');

    if(index >= 0){
      final viagem = _viagens[index];
      Uri _editUrl = Uri.parse('https://costtrip-dec61-default-rtdb.firebaseio.com/viagens/${viagem.id_viagem}.json');
      _viagens.remove(viagem);
      notifyListeners();

      final response = await http.delete(_editUrl);

      if (response.statusCode >= 400){
        _viagens.insert(index, viagem);
        notifyListeners();
      }
    }
  }

  Future<void> makeChek_in(Viagem viagemCheckIN) async{

    if(!viagemCheckIN.check_in){
      viagemCheckIN.makeChek_in();
    }

    Uri _baseUrl = Uri.parse('https://costtrip-dec61-default-rtdb.firebaseio.com/viagens/${viagemCheckIN.id_viagem}.json');

    final response = await http.patch(
        _baseUrl,
        body: json.encode({
          'check_in': viagemCheckIN.check_in,
        })
    );
    if(response.statusCode >= 400){
      viagemCheckIN.makeChek_in();
    }
  }

  Future<void> makeChek_out(Viagem viagemCheckOUT) async{

    if(!viagemCheckOUT.check_out) {
      viagemCheckOUT.makeChek_out();
    }

    Uri _baseUrl = Uri.parse('https://costtrip-dec61-default-rtdb.firebaseio.com/viagens/${viagemCheckOUT.id_viagem}.json');

    final response = await http.patch(
        _baseUrl,
        body: json.encode({
          'check_out': viagemCheckOUT.check_out,
        })
    );
    if(response.statusCode >= 400){
      viagemCheckOUT.makeChek_out();
    }
  }
}