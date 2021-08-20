import 'package:cost_trip/views/transporte_viagem.dart';
import 'package:cost_trip/widgets/app_bar.dart';
import 'package:flutter/material.dart';


class TransporteViagem extends StatefulWidget {

  final Map<String, Object> formDataViajem;

  const TransporteViagem({Key? key, required this.formDataViajem}) : super(key: key);

  @override
  _TransporteViagemState createState() => _TransporteViagemState();
}

class _TransporteViagemState extends State<TransporteViagem> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBarViagem(name_page: "Selecione o transporte", tamanho_fonte: 18, exibir_return: true, exibir_perfil: false, rota: '/pagNovaViagem',),
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(top: 110.0),
            child: TransporteForm(formDataViajem: widget.formDataViajem),
          )
        ],
      ),
    );
  }
}

