class CarteiraModel {
  String nome;
  double valor;
  String imgR;
  int qtdeRemedio = 0;
  CarteiraModel({
    required this.nome,
    required this.valor,
    required this.imgR,
    required this.qtdeRemedio,
  });
}
List<CarteiraModel> carteiraModel = [];