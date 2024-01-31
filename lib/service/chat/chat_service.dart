import 'package:app_chat_aula/models/chat_message.dart';
import 'package:app_chat_aula/models/chat_user.dart';
import 'package:app_chat_aula/service/chat/chat_firebase_service.dart';

abstract class ChatService {
  Stream<List<ChatMessage>> messageStream();
  Future<ChatMessage?> save(String text, ChatUser user);

  factory ChatService() {
    // return ChatMockService();
    return ChatFirebaseService();
  }
}
