class Remedio {
  final int id;
  final String nomeRemedio;
  final String descRemedio;
  final String imagemRemedio;
  final double valorRemedio;

const Remedio({
  required this.id,
  required this.nomeRemedio,
  required this.descRemedio,
  required this.imagemRemedio,
  required this. valorRemedio,
});

factory Remedio.fromJson(Map<String, dynamic> json) => Remedio(
        id: json['id'],
        nomeRemedio: json['nomeRemedio'],
        descRemedio: json['descRemedio'],
        imagemRemedio: json['imagemRemedio'],
        valorRemedio: json['valorRemedio'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nomeRemedio':nomeRemedio,
        'descRemedio': descRemedio,
        'imagemRemedio': imagemRemedio,
        'valorRemedio': valorRemedio
      };
}

