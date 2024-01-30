import 'package:app_chat_aula/models/chat_message.dart';
import 'package:app_chat_aula/service/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChatMessage>>(
      stream: ChatService().messageStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('Sem Dados. Vamos Conversar?'),
          );
        } else {
          final msgs = snapshot.data!;
          return ListView.builder(
            itemCount: msgs.length,
            itemBuilder: (context, index) => Text(msgs[index].text),
          );
        }
      },
    );
  }
}
