import 'package:cost_trip/modelo/acomodacao.dart';
import 'package:cost_trip/modelo/viagem.dart';
import 'package:flutter/material.dart';


class AcomodacaoForm extends StatefulWidget {

  final Map<String, Object> formDataViajem, formDataTransporte;

  const AcomodacaoForm({Key? key, required this.formDataViajem, required this.formDataTransporte}) : super(key: key);

  @override
  _AcomodacaoFormState createState() => _AcomodacaoFormState();
}

class _AcomodacaoFormState extends State<AcomodacaoForm> {

  final _form = GlobalKey<FormState>();
  final _formDataAcomodacao = Map<String, Object>();
  int _currentStep = 0;

  void _saveForm(){
    _form.currentState!.save();
    print(_formDataAcomodacao['custo_acomodacao']);
    print(_formDataAcomodacao['custo_estacionamento']);
    print(_formDataAcomodacao['seguro_local']);
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
                onChanged: (value) => _formDataAcomodacao['custo_acomodacao'] = double.parse(value),
                decoration: InputDecoration(
                    labelText: ('Custos da acomodação'),
                    icon: Icon(Icons.bedtime)
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onChanged: (value) => _formDataAcomodacao['custo_estacionamento'] = double.parse(value),
                decoration: InputDecoration(
                    labelText: ('Custos de estacionamento'),
                    icon: Icon(Icons.car_repair)
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                onChanged: (value) => _formDataAcomodacao['seguro_local'] = double.parse(value),
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

