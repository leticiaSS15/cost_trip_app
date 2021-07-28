import 'package:cost_trip/views/acomodacao_viagem.dart';
import 'package:cost_trip/widgets/app_bar.dart';
import 'package:flutter/material.dart';


class AcomodacaoViagem extends StatefulWidget {

  @override
  _AcomodacaoViagemState createState() => _AcomodacaoViagemState();
}

class _AcomodacaoViagemState extends State<AcomodacaoViagem> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBarViagem(name_page: "Selecione a Acomodação", tamanho_fonte: 16, exibir_return: true, exibir_perfil: false,),
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(top: 110.0),
            child: AcomodacaoForm(),
          )
        ],
      ),
    );
  }
}

