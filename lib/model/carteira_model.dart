class CarteiraModels {
  String nome;
  double valor;
  String imgR;
  int qtdeRemedio = 0;
  CarteiraModels({
    required this.nome,
    required this.valor,
    required this.imgR,
    required this.qtdeRemedio,
  });
}
List<CarteiraModels> carteiraModels = [];