import 'package:cost_trip/widgets/app_bar.dart';
import 'package:cost_trip/widgets/card_viagem.dart';
import 'package:flutter/material.dart';

class VeiculoCadastrado extends StatefulWidget {
  @override
  _VeiculoCadastradoState createState() => _VeiculoCadastradoState();
}

class _VeiculoCadastradoState extends State<VeiculoCadastrado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBarViagem(name_page: 'Veìculos cadastrados', tamanho_fonte: 20.0, exibir_return: true, exibir_perfil: false,),
          Card(
              margin: EdgeInsets.symmetric(
                vertical: 320,
                horizontal: 10,
              ),
              child: CardViewViagem()
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100.0, right: 10.0, top: 600.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Text("Cadastrar novo veículo",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              color: Colors.greenAccent,
              onPressed: (){
                Navigator.pushNamed(context, '/pagCadastroVeiculo');
              },
            ),
          ),
        ],
      ),
    );
  }
}

