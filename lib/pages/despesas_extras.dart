import 'package:cost_trip/modelo/transporte.dart';
import 'package:cost_trip/modelo/viagem.dart';
import 'package:cost_trip/views/acomodacao_viagem.dart';
import 'package:cost_trip/views/despesas_viagens.dart';
import 'package:cost_trip/widgets/app_bar.dart';
import 'package:flutter/material.dart';


class DespesasExtras extends StatefulWidget {

  final Viagem viagem;
  final double restanteOrcamento;

  const DespesasExtras({Key? key, required this.viagem, required this.restanteOrcamento}) : super(key: key);

  @override
  _DespesasExtrasState createState() => _DespesasExtrasState();
}

class _DespesasExtrasState extends State<DespesasExtras> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBarViagem(name_page: "Despesas Extras", tamanho_fonte: 25, exibir_return: true, exibir_perfil: false, rota: '/pagMinhasViagens',),
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(top: 130.0, right: 20, left: 30),
            child: Text('Separe uma quantia para alguns gastos emergenciais', style: TextStyle(fontSize: 17),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0, right: 30, left: 30),
            child: DespesasViagem(viagem: widget.viagem, restanteOrcamento: widget.restanteOrcamento,),
          ),
        ],
      ),
    );
  }
}

