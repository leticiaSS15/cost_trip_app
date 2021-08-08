import 'package:cost_trip/modelo/transporte.dart';
import 'package:cost_trip/modelo/viagem.dart';
import 'package:cost_trip/pages/cadastrar_veiculo.dart';
import 'package:cost_trip/pages/home_page.dart';
import 'package:cost_trip/pages/historico_viagens.dart';
import 'package:cost_trip/pages/minhas_viagens.dart';
import 'package:cost_trip/pages/nova_viagem.dart';
import 'package:cost_trip/pages/selecao_acomodacao_viagem.dart';
import 'package:cost_trip/pages/selecao_transporte_viagem.dart';
import 'package:cost_trip/pages/usuario_page.dart';
import 'package:cost_trip/pages/visualizar_viagem.dart';
import 'package:cost_trip/database/db_viagens.dart';
import 'package:cost_trip/views/transporte_viagem.dart';
import 'package:cost_trip/views/veiculo_cadastrado.dart';
import 'package:cost_trip/views/view_viagem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late final Transporte transporte;
  late final Viajem viajem;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return ChangeNotifierProvider(
      create: (_) => DbViagens(),
      child: MaterialApp(
        title: 'Cost Trip',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        initialRoute: '/',
        routes: {
          '/pagMinhasViagens': (context) => MinhaViagem(),
          '/pagHistoricoViagem': (context) => HistoricoViagens(),
          '/pagUsuário': (context) => UsuarioPage(),
          '/pagCadastroVeiculo': (context) => CadastroVeiculo(edit: true,),
          '/pagVeiculoCadastrado': (context) => VeiculoCadastrado(),
          '/pagNovaViagem': (context) => NovaViagem(),
          '/pagTransporteViagem': (context) => TransporteViagem(formDataViajem: {},),
          '/pagAcomodacaoViagem': (context) => AcomodacaoViagem(formDataViajem: {}, transporte: transporte,),
          '/pagVisualizarViagem': (context) => VisualizarViagem(tela: '', viagem: viajem),
        },
        home: HomePage(),
      ),
    );
  }
}
