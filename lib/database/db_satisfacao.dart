import 'dart:convert';
import 'package:cost_trip/modelo/satisfacao.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DbSatisfacao with ChangeNotifier {

  Uri _baseUrl = Uri.parse('https://costtrip-dec61-default-rtdb.firebaseio.com/satisfacao.json');

  List<PesquisaSatisfacao> _pesquisaSatisfacao = [];

  List<PesquisaSatisfacao> get pesquisaSatisfacao => [ ..._pesquisaSatisfacao];

  PesquisaSatisfacao pesq = PesquisaSatisfacao(id_satisfacao: '', boas_viagens: 0, mas_viagens: 0, total_viagens: 0);


  Future<void> addOpniao(PesquisaSatisfacao satisfacao) async {
    final response = await http.post(
        _baseUrl,
        body: json.encode({
          'boas_viagens': satisfacao.boas_viagens,
          'mas_viagens': satisfacao.mas_viagens,
          'total_viagens': satisfacao.total_viagens,
        })
    );
    _pesquisaSatisfacao.add(PesquisaSatisfacao(
        id_satisfacao: json.decode(response.body)['name'],
        boas_viagens: satisfacao.boas_viagens,
        mas_viagens: satisfacao.mas_viagens,
        total_viagens: satisfacao.total_viagens,
    ));
    notifyListeners();
  }

  Future<void> loadOpniao(String idOpniao) async {
    final response = await http.get(_baseUrl);
    Map<String, dynamic> dados = json.decode(response.body);
    _pesquisaSatisfacao.clear();
    //print(json.decode(response.body));
    if(dados != null){
      dados.forEach((pesqId, pesqData) {
        if(pesqId == idOpniao){
          pesq = PesquisaSatisfacao(
              id_satisfacao: pesqId,
              boas_viagens: pesqData['boas_viagens'],
              mas_viagens: pesqData['mas_viagens'],
              total_viagens: pesqData['total_viagens'],
          );
        }
        _pesquisaSatisfacao.add(PesquisaSatisfacao(
            id_satisfacao: pesqId,
            boas_viagens: pesqData['boas_viagens'],
            mas_viagens:  pesqData['mas_viagens'],
            total_viagens:  pesqData['total_viagens'],
        ));
      });
      notifyListeners();
    }
    return Future.value();
  }

  Future<void> updateBoasViagens(PesquisaSatisfacao satisfacao) async {

    final index = _pesquisaSatisfacao.indexWhere((opniao) => opniao.id_satisfacao == satisfacao.id_satisfacao);
    Uri _editUrl = Uri.parse('https://costtrip-dec61-default-rtdb.firebaseio.com/satisfacao/${satisfacao.id_satisfacao}.json');

    if(index >= 0){
      await http.patch(
          _editUrl,
          body: json.encode({
            'boas_viagens': satisfacao.boas_viagens + 1,
            'mas_viagens': satisfacao.mas_viagens,
            'total_viagens': satisfacao.total_viagens + 1,
          })
      );
      _pesquisaSatisfacao[index] = satisfacao;
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> updateMasViagens(PesquisaSatisfacao satisfacao) async {

    final index = _pesquisaSatisfacao.indexWhere((opniao) => opniao.id_satisfacao == satisfacao.id_satisfacao);
    Uri _editUrl = Uri.parse('https://costtrip-dec61-default-rtdb.firebaseio.com/satisfacao/${satisfacao.id_satisfacao}.json');

    if(index >= 0){
      await http.patch(
          _editUrl,
          body: json.encode({
            'boas_viagens': satisfacao.boas_viagens,
            'mas_viagens': satisfacao.mas_viagens + 1,
            'total_viagens': satisfacao.total_viagens + 1,
          })
      );
      _pesquisaSatisfacao[index] = satisfacao;
      notifyListeners();
    }
    notifyListeners();
  }

}