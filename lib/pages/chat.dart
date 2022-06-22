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
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        backgroundColor: Colors.pink.shade900,
        actions: const <Widget>[
          Icon(
            Icons.chat_outlined,
            size: 50,
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: height * 0.03),
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
