import 'dart:convert';
import 'dart:math';
import 'package:cost_trip/modelo/transporte.dart';
import 'package:cost_trip/modelo/viagem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DbTransporte with ChangeNotifier {

  String id_transporte = '';

  Uri _baseUrl = Uri.parse('https://costtrip-dec61-default-rtdb.firebaseio.com/transporte.json');

  List<Transporte> _transportes = [];

  List<Transporte> get transportes => [ ..._transportes];

  int get itemsCount {
    return _transportes.length;
  }

  Transporte newTransporte = Transporte(id_transporte: '', custo_passagem: 0.0, custo_bagagem: 0.0, seguro_viagem: 0.0, total_gastos_transporte: 0.0);

  Future<String> addTransporte(Transporte newTransporte) async {
    final response = await http.post(
        _baseUrl,
        body: json.encode({
          'custo_passagem': newTransporte.custo_passagem,
          'custo_bagagem': newTransporte.custo_bagagem,
          'seguro_viagem': newTransporte.seguro_viagem,
          'total_gastos_transporte': newTransporte.total_gastos_transporte,
        })
    );
    _transportes.add(Transporte(
      id_transporte: json.decode(response.body)['name'],
    custo_passagem: newTransporte.custo_passagem,
    custo_bagagem: newTransporte.custo_bagagem,
    seguro_viagem: newTransporte.seguro_viagem,
    total_gastos_transporte: newTransporte.total_gastos_transporte,
    ));

    notifyListeners();

    return id_transporte = json.decode(response.body)['name'].toString();
  }

  Future<void> updateTransporte(Transporte transporte) async {
    if(transporte == null || transporte.id_transporte == null) {
      return;
    }

    final index = _transportes.indexWhere((trip) => trip.id_transporte == transporte.id_transporte);
    Uri _editUrl = Uri.parse('https://costtrip-dec61-default-rtdb.firebaseio.com/viagens/${transporte.id_transporte}.json');

    if(index >= 0){
      await http.patch(
          _editUrl,
          body: json.encode({
            'custo_passagem': transporte.custo_passagem,
            'custo_bagagem': transporte.custo_bagagem,
            'seguro_viagem': transporte.seguro_viagem,
            'total_gastos_transporte': transporte.total_gastos_transporte,
          })
      );
      _transportes[index] = transporte;
      notifyListeners();
    }
  }

  Future<void> loadAllTransporte() async {
    final response = await http.get(_baseUrl);
    //print(json.decode(response.body));
    Map<String, dynamic> dados = json.decode(response.body);
    _transportes.clear();
    print(json.decode(response.body));
    if(dados != null){
      dados.forEach((viagemId, viagemData) {
        _transportes.add(Transporte(
            id_transporte: viagemId,
            custo_passagem: viagemData['custo_passagem'],
            custo_bagagem: viagemData['custo_bagagem'],
            seguro_viagem: viagemData['seguro_viagem'],
            total_gastos_transporte: viagemData['total_gastos_transporte'],
        ));
      });
      notifyListeners();
    }
    return Future.value();
  }

  Future<void> loadTransporte(String idTransporte) async {

    final response = await http.get(_baseUrl);
    Map<String, dynamic> dados = json.decode(response.body);
    _transportes.clear();

    dados.forEach((trasnId, transData) {
      if(trasnId == idTransporte){
        newTransporte = Transporte(
            id_transporte: trasnId,
            custo_passagem: transData['custo_passagem'],
            custo_bagagem: transData['custo_bagagem'],
            seguro_viagem: transData['seguro_viagem'],
            total_gastos_transporte: transData['total_gastos_transporte'] );
      }
    });
    notifyListeners();
    return Future.value();
  }



  Future<void> deleteTransporte(String id) async {
    final index = _transportes.indexWhere((trans) => trans.id_transporte == id);

    if(index >= 0){
      final transportes = _transportes[index];
      Uri _editUrl = Uri.parse('https://costtrip-dec61-default-rtdb.firebaseio.com/viagens/${transportes.id_transporte}.json');
      _transportes.remove(transportes);
      notifyListeners();

      final response = await http.delete(_editUrl);

      if (response.statusCode >= 400){
        _transportes.insert(index, transportes);
        notifyListeners();
      }
    }
  }


}