import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Minhas Notificações',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: const Text('Notificações'),
    );
  }
}
