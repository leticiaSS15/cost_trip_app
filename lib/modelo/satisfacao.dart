import 'package:flutter/material.dart';

class PesquisaSatisfacao with ChangeNotifier {

  final String id_satisfacao;
  final int boas_viagens;
  final int mas_viagens;
  final int total_viagens;

  PesquisaSatisfacao({
    required this.id_satisfacao,
    required this.boas_viagens,
    required this.mas_viagens,
    required this.total_viagens});


}