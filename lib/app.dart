import 'package:flutter/material.dart';
import 'package:roller_dice_app/gradient_container.dart';
import 'package:roller_dice_app/roller_dice.dart';

class RollerDiceApp extends StatefulWidget {
  const RollerDiceApp({super.key});

  @override
  State<RollerDiceApp> createState() => _RollerDiceAppState();
}

class _RollerDiceAppState extends State<RollerDiceApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 54, 93),
        title: const Text('Roller Dice Application'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: const RollerDice(),
      ),
    ));
  }
}
