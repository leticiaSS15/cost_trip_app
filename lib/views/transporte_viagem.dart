import 'package:cost_trip/pages/selecao_acomodacao_viagem.dart';
import 'package:flutter/material.dart';

class TransporteForm extends StatefulWidget {

  final Map<String, Object> formDataViajem;

  const TransporteForm({Key? key, required this.formDataViajem}) : super(key: key);

  @override
  _TransporteFormState createState() => _TransporteFormState();
}

class _TransporteFormState extends State<TransporteForm> {

  final _form = GlobalKey<FormState>();
  final _formDataTransporte = Map<String, Object>();
  int _currentStep = 0;

  _saveForm(){
    _form.currentState!.save();
    print(_formDataTransporte['custo_passagem']);
    print(_formDataTransporte['seguro_viajem']);
    print(_formDataTransporte['custo_bagagem']);
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
                _saveForm();
                //Navigator.pushNamed(context, '/pagAcomodacaoViagem');
                Navigator.push(context, MaterialPageRoute(builder: (context) => AcomodacaoViagem(formDataViajem: widget.formDataViajem, formDataTransporte: _formDataTransporte,)));
              }
            });
          },
          onStepCancel: (){
            Navigator.pop(context, '/pagNovaViagem');
          },
        ),
      ),
    );
  }

  List<Step> _mySteps(){
    List<Step> _steps = [
      Step(
        title: Text('Meio de transporte'),
        content: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onSaved: (value) => _formDataTransporte['custo_passagem'] = double.parse(value!),
                decoration: InputDecoration(
                    labelText: ('Custos de passagem'),
                    icon: Icon(Icons.monetization_on)
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onSaved: (value) => _formDataTransporte['custo_bagagem'] = double.parse(value!),
                decoration: InputDecoration(
                    labelText: ('Custos de bagagem'),
                    icon: Icon(Icons.shopping_bag_rounded)
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.number,
                onSaved: (value) => _formDataTransporte['seguro_viajem'] = double.parse(value!),
                decoration: InputDecoration(
                    labelText: ('Seguro viajem'),
                    icon: Icon(Icons.local_hospital)
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                  onPressed: (){},
                  child: Text('Utilizar carro próprio')
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

