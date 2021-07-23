import 'package:cost_trip/views/usuario_form.dart';
import 'package:cost_trip/widgets/app_bar.dart';
import 'package:cost_trip/widgets/card_viagem.dart';
import 'package:flutter/material.dart';


class UsuarioPage extends StatefulWidget {

  @override
  _UsuarioPageState createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
            AppBarViagem(name_page: 'Meus dados', tamanho_fonte: 30, tipo_page: false),
            SizedBox(height: 100),
            UsuarioForm()
          ],
        ),
    );
  }
}

