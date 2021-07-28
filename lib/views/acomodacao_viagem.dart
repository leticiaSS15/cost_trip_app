import 'package:flutter/material.dart';


class AcomodacaoForm extends StatefulWidget {

  @override
  _AcomodacaoFormState createState() => _AcomodacaoFormState();
}

class _AcomodacaoFormState extends State<AcomodacaoForm> {

  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  int _currentStep = 0;


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
                print('AQUI SUBMETE');
              }
            });
          },
          onStepCancel: (){
            setState(() {
              if(this._currentStep > 0){
                this._currentStep = this._currentStep - 1;
              } else {
                this._currentStep  = 0;
              }
            });
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
        content: Text('AQUI UM DROPBOX'),
        isActive: _currentStep >= 5,
      ),
    ];
    return _steps;
  }

}

