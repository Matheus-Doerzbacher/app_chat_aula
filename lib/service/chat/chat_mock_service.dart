import 'dart:async';
import 'dart:math';
import 'package:app_chat_aula/models/chat_message.dart';
import 'package:app_chat_aula/models/chat_user.dart';
import 'package:app_chat_aula/service/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      text: 'Bom diia!!',
      createdAt: DateTime.now(),
      userId: '1',
      userName: 'Tabata',
      userImageURL: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '2',
      text: 'Bom dia meu povo!',
      createdAt: DateTime.now(),
      userId: '312',
      userName: 'Lucas',
      userImageURL: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '3',
      text: 'Bom dia galera',
      createdAt: DateTime.now(),
      userId: '456',
      userName: 'Mica',
      userImageURL: 'assets/images/avatar.png',
    ),
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<ChatMessage>> messageStream() {
    return _msgsStream;
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageURL: user.imageURL,
    );

    _msgs.add(newMessage);
    _controller?.add(_msgs);
    return newMessage;
  }
}
