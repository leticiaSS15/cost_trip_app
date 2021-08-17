class Transporte{
  final String id_transporte;
  final double custo_passagem;
  final double custo_bagagem;
  final double seguro_viagem;
  final double total_gastos_transporte;

  Transporte({
    required this.id_transporte,
    required this.custo_passagem,
    required this.custo_bagagem,
    required this.seguro_viagem,
    required this.total_gastos_transporte
  });
}