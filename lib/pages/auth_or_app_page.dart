import 'package:app_chat_aula/models/chat_user.dart';
import 'package:app_chat_aula/pages/auth_page.dart';
import 'package:app_chat_aula/pages/chat_page.dart';
import 'package:app_chat_aula/pages/loading_page.dart';
import 'package:app_chat_aula/service/auth/auth_mock_service.dart';
import 'package:flutter/material.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ChatUser?>(
          stream: AuthMockService().userChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingPage();
            } else {
              return snapshot.hasData ? const ChatPage() : const AuthPage();
            }
          }),
    );
  }
}
