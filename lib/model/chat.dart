class Chats {
  final int id;
  final String nomeChat;
  final String descChat;
  final String imagemChat;
  final String dataChat;

  const Chats({
    required this.id,
    required this.nomeChat,
    required this.descChat,
    required this.imagemChat,
    required this.dataChat,
  });

  factory Chats.fromJson(Map<String, dynamic> json) => Chats(
        id: json['id'],
        nomeChat: json['nomeChat'],
        descChat: json['descChat'],
        imagemChat: json['imagemChat'],
        dataChat: json['dataChat'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nomeChat': nomeChat,
        'descChat': descChat,
        'imagemChat': imagemChat,
        'dataChat': dataChat,
      };
}
