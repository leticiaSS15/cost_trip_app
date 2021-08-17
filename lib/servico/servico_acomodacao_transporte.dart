import 'package:cost_trip/database/db_acomodacao.dart';
import 'package:cost_trip/database/db_transporte.dart';
import 'package:cost_trip/database/db_viagens.dart';
import 'package:cost_trip/modelo/acomodacao.dart';
import 'package:cost_trip/modelo/transporte.dart';
import 'package:cost_trip/modelo/viagem.dart';
import 'package:cost_trip/pages/visualizar_viagem.dart';
import 'package:cost_trip/views/visualizar_viagem.dart';
import 'package:flutter/material.dart';

class ServicoAcoTrans extends StatefulWidget {

  final Viagem viagem;
  final String tela;

  const ServicoAcoTrans({Key? key, required this.viagem, required this.tela}) : super(key: key);

  @override
  _ServicoAcoTransState createState() => _ServicoAcoTransState();
}

class _ServicoAcoTransState extends State<ServicoAcoTrans> {


  DbViagens _dbViagens = DbViagens();
  DbAcomodacao _dbAcomodacao = DbAcomodacao();
  DbTransporte _dbTransporte = DbTransporte();
  Acomodacao newAcomodacao = Acomodacao(id_acomodacao: '', custo_acomodacao: 0.0, custo_estacionamento: 0.0, seguro_local: 0.0, total_gastos_acomodacao: 0.0);
  Transporte newTransporte = Transporte(id_transporte: '', custo_passagem: 0.0, custo_bagagem: 0.0, seguro_viagem: 0.0, total_gastos_transporte: 0.0);
  bool _isLoading = true;


  Acomodacao loadingAco() {
     _dbAcomodacao.loadAcomodacao(widget.viagem.id_acomodacao);
     var acomodacao;
    return acomodacao = _dbAcomodacao.newAcomodacao;
    //print(newAcomodacao.id_acomodacao);
  }

  Transporte loadTrasn(){
    _dbTransporte.loadTransporte(widget.viagem.id_transporte);
    var transporte;
    return transporte = _dbTransporte.newTransporte;
  }

  @override
  Widget build(BuildContext context) {
    newAcomodacao = loadingAco();
    newTransporte = loadTrasn();
    if(newAcomodacao.id_acomodacao.isNotEmpty && newTransporte.id_transporte.isNotEmpty){
      _isLoading = false;
    }
    return _isLoading ? Center(child: CircularProgressIndicator(),) : VisualizarViagem(tela: widget.tela, viagem: widget.viagem, acomodacao: newAcomodacao, transporte: newTransporte,);
  }
}