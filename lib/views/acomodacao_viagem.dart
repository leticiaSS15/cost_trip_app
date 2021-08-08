import 'package:cost_trip/modelo/acomodacao.dart';
import 'package:cost_trip/modelo/transporte.dart';
import 'package:cost_trip/modelo/viagem.dart';
import 'package:flutter/material.dart';
import 'package:cost_trip/servico/servico_viagens.dart';

class AcomodacaoForm extends StatefulWidget {

  final Map<String, Object> formDataViajem;
  final Transporte transporte;

  const AcomodacaoForm({Key? key, required this.formDataViajem, required this.transporte}) : super(key: key);

  @override
  _AcomodacaoFormState createState() => _AcomodacaoFormState();
}

class _AcomodacaoFormState extends State<AcomodacaoForm> {

  final _form = GlobalKey<FormState>();
  double custo_acomodacao = 0.0;
  double custo_estacionamento = 0.0;
  double seguro_local = 0.0;
  int _currentStep = 0;

  ServicoViagem servico = ServicoViagem();

  void _saveForm(){
    _form.currentState!.save();

    final newAcomodacao = Acomodacao(
      id: '',
      custo_acomodacao: custo_acomodacao,
      custo_estacionamento: custo_estacionamento,
      seguro_local: seguro_local,
      total_gastos_acomodacao: (custo_acomodacao + custo_estacionamento + seguro_local),
    );

    servico.salvar(widget.formDataViajem, widget.transporte, newAcomodacao);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:Form(
        key: _form,
        child: Stepper(
          steps: _mySteps(),
          currentStep: this._currentStep,
          onStepContinue: (){
            setState(() {
              if(this._currentStep < this._mySteps().length - 1){
                this._currentStep = this._currentStep + 1;
              } else {
                //Navigator.push(context, '/pagMinhasViagens');
                _saveForm();
              }
            });
          },
          onStepCancel: (){
            Navigator.pop(context, '/pagTransporteViagem');
          },
        ),
      ),
    );
  }

  List<Step> _mySteps(){
    var tipoSaida;
    List<Step> _steps = [
      Step(
        title: Text('Acomodação'),
        content: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onChanged: (value) => custo_acomodacao = double.parse(value),
                decoration: InputDecoration(
                    labelText: ('Custos da acomodação'),
                    icon: Icon(Icons.bedtime)
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onChanged: (value) => custo_estacionamento = double.parse(value),
                decoration: InputDecoration(
                    labelText: ('Custos de estacionamento'),
                    icon: Icon(Icons.car_repair)
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                onChanged: (value) => seguro_local = double.parse(value),
                decoration: InputDecoration(
                    labelText: ('Seguro do local'),
                    icon: Icon(Icons.local_hospital)
                ),
              ),
            ],
          ),
        ),
        isActive: _currentStep >= 1,
      ),
    ];
    return _steps;
  }

}

