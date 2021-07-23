import 'package:cost_trip/pages/home_page.dart';
import 'package:cost_trip/pages/login_page.dart';
import 'package:cost_trip/pages/historico_viagens.dart';
import 'package:cost_trip/pages/minhas_viagens.dart';
import 'package:cost_trip/pages/usuario_page.dart';
import 'package:cost_trip/views/usuario_form.dart';
import 'package:cost_trip/widgets/card_viagem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Cost Trip',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/pagMinhasViagens': (context) => MinhaViagem(),
        '/pagHistoricoViagem': (context) => HistoricoViagens(),
        '/pagUsuário': (context) => UsuarioPage(),
      },
      home: HomePage(),
    );
  }
}
