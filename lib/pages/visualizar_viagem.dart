import 'package:cost_trip/database/db_acomodacao.dart';
import 'package:cost_trip/database/db_viagens.dart';
import 'package:cost_trip/modelo/acomodacao.dart';
import 'package:cost_trip/modelo/transporte.dart';
import 'package:cost_trip/modelo/viagem.dart';
import 'package:cost_trip/views/viagem_form.dart';
import 'package:cost_trip/views/visualizar_viagem.dart';
import 'package:cost_trip/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class VisualizarViagem extends StatefulWidget {

  final String tela;
  final Viagem viagem;
  final Acomodacao acomodacao;
  final Transporte transporte;


  const VisualizarViagem({Key? key, required this.tela, required this.viagem, required this.acomodacao, required this.transporte}) : super(key: key);
  @override
  _VisualizarViagemState createState() => _VisualizarViagemState();
}

class _VisualizarViagemState extends State<VisualizarViagem> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBarViagem(name_page: "Detalhes da Viagem", tamanho_fonte: 19, exibir_return: true, exibir_perfil: false, rota: '/pagMinhasViagens',),
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(top: 110.0),
            child: ViewViagem(tela: widget.tela, viagem: widget.viagem, acomodacao: widget.acomodacao, transporte: widget.transporte),
          )
        ],
      ),
    );
  }
}

