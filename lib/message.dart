import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String winnerMessage;

  const Message({super.key, required this.winnerMessage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:const  Text('Game Summary'),
      content: Text('Output: $winnerMessage'),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); 
          },
          child:const Text('OK'),
        ),
      ],
    );
  }
}
