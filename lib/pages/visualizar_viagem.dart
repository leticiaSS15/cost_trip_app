import 'package:cost_trip/views/viagem_form.dart';
import 'package:cost_trip/views/view_viagem.dart';
import 'package:cost_trip/widgets/app_bar.dart';
import 'package:flutter/material.dart';


class VisualizarViagem extends StatefulWidget {

  final String tela;

  const VisualizarViagem({Key? key, required this.tela}) : super(key: key);
  @override
  _VisualizarViagemState createState() => _VisualizarViagemState();
}

class _VisualizarViagemState extends State<VisualizarViagem> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBarViagem(name_page: "Detalhes da Viagem", tamanho_fonte: 19, exibir_return: true, exibir_perfil: true,),
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(top: 110.0),
            child: ViewViagem(tela: widget.tela,),
          )
        ],
      ),
    );
  }
}
