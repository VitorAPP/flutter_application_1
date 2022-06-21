import 'package:flutter/material.dart';

import '../dado/chat_dado.dart';
import '../model/chat.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _StateChat createState() => _StateChat();
}

class _StateChat extends State<Chat> {
  late List<Chats> chats;

  void initState() {
    super.initState();

    chats = todosChats;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return buildBook(chat);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildBook(Chats chat) => ListTile(
        leading: Image.asset(
          chat.imagemChat,
          fit: BoxFit.cover,
          width: 60,
          height: 60,
        ),
        title: Text(chat.nomeChat),
        subtitle: Text(chat.descChat),
        isThreeLine: true,
        trailing: Text(chat.dataChat),
      );
}
