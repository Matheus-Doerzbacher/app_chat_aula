import 'package:app_chat_aula/service/auth/auth_service.dart';
import 'package:app_chat_aula/service/chat/chat_service.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  String _message = '';
  final _messageController = TextEditingController();

  Future<void> _sendMessage() async {
    final user = AuthService().currentUser;
    if (user != null) {
      await ChatService().save(_message, user);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _messageController,
                onChanged: (msg) => setState(() => _message = msg),
                decoration: const InputDecoration(
                  labelText: 'Enviar Mensagem...',
                ),
                onSubmitted: (_) {
                  if (_message.trim().isNotEmpty) {
                    _sendMessage();
                  }
                },
              ),
            ),
          ),
          IconButton(
            onPressed: _message.trim().isEmpty ? null : _sendMessage,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
