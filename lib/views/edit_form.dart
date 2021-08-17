import 'package:cost_trip/modelo/acomodacao.dart';
import 'package:cost_trip/modelo/transporte.dart';
import 'package:cost_trip/pages/selecao_acomodacao_viagem.dart';
import 'package:cost_trip/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class EditForm extends StatefulWidget {

  final String edit_page;
  final Acomodacao acomodacao;
  final Transporte transporte;

  const EditForm({Key? key, required this.edit_page, required this.acomodacao, required this.transporte}) : super(key: key);

  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {

  final _form = GlobalKey<FormState>();
  double custo_passagem = 0.0;
  double seguro_viagem = 0.0;
  double custo_bagagem = 0.0;
  int _currentStep = 0;

  _saveForm(){
    _form.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:Form(
        key: _form,
        child: Stack(
          children: <Widget>[
            AppBarViagem(name_page: widget.edit_page, tamanho_fonte: 25, exibir_return: true, exibir_perfil: false),
            if(widget.edit_page == 'Transporte')Padding(
              padding: const EdgeInsets.only(top: 150.0, left: 20.0, right: 50.0),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: widget.transporte.custo_passagem.toString(),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onSaved: (value) => custo_passagem = double.parse(value!),
                    decoration: InputDecoration(
                        labelText: ('Custos de passagem'),
                        icon: Icon(Icons.monetization_on)
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: widget.transporte.custo_bagagem.toString(),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onSaved: (value) => custo_bagagem = double.parse(value!),
                    decoration: InputDecoration(
                        labelText: ('Custos de bagagem'),
                        icon: Icon(Icons.shopping_bag_rounded)
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: widget.transporte.seguro_viagem.toString(),
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.number,
                    onSaved: (value) => seguro_viagem = double.parse(value!),
                    decoration: InputDecoration(
                        labelText: ('Seguro viajem'),
                        icon: Icon(Icons.local_hospital)
                    ),
                  ),
                ],
              ),
            ),
            if(widget.edit_page == 'Acomodação')Padding(
              padding: const EdgeInsets.only(top: 150.0, left: 20.0, right: 50.0),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: widget.acomodacao.custo_acomodacao.toString(),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onSaved: (value) => custo_passagem = double.parse(value!),
                    decoration: InputDecoration(
                        labelText: ('Custos de acomodação'),
                        icon: Icon(Icons.monetization_on)
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: widget.acomodacao.custo_estacionamento.toString(),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onSaved: (value) => custo_bagagem = double.parse(value!),
                    decoration: InputDecoration(
                        labelText: ('Custos de estacionamento'),
                        icon: Icon(Icons.directions_car)
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: widget.acomodacao.seguro_local.toString(),
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.number,
                    onSaved: (value) => seguro_viagem = double.parse(value!),
                    decoration: InputDecoration(
                        labelText: ('Seguro local'),
                        icon: Icon(Icons.local_hospital)
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }

}

