import 'package:cost_trip/views/cadastro_veiculo_form.dart';
import 'package:cost_trip/views/usuario_form.dart';
import 'package:cost_trip/widgets/app_bar.dart';
import 'package:flutter/material.dart';


class CadastroVeiculo extends StatefulWidget {

  final bool edit;

  const CadastroVeiculo({Key? key, required this.edit}) : super(key: key);

  @override
  _CadastroVeiculoState createState() => _CadastroVeiculoState();
}

class _CadastroVeiculoState extends State<CadastroVeiculo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBarViagem(name_page: "Cadastrar veículo", tamanho_fonte: 20, exibir_return: true, exibir_perfil: false,),
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: CadastroVeiculoForm(edit: widget.edit,),
          )
        ],
      ),
    );
  }
}

