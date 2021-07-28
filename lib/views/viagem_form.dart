import 'package:flutter/material.dart';


class NovaViagemForm extends StatefulWidget {

  @override
  _NovaViagemFormState createState() => _NovaViagemFormState();
}

class _NovaViagemFormState extends State<NovaViagemForm> {

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
                Navigator.pushNamed(context, '/pagTransporteViagem');
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
    List<Step> _steps = [
      Step(
        title: Text('Teto de gastos'),
        content: TextField(),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Destino'),
        content: TextField(),
        isActive: _currentStep >= 2,
      ),
      Step(
        title: Text('Datas'),
        content: ElevatedButton(onPressed: (){}, child: null,),
        isActive: _currentStep >= 3,
      ),
      Step(
        title: Text('Horário saída'),
        content: ElevatedButton(onPressed: (){}, child: null,),
        isActive: _currentStep >= 4,
      ),
      Step(
        title: Text('Horário chegada'),
        content: ElevatedButton(onPressed: (){}, child: null,),
        isActive: _currentStep >= 5,
      ),
    ];
    return _steps;
  }

}

