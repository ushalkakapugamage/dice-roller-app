import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roller_dice_app/app.dart';
import 'package:roller_dice_app/gradient_container.dart';
import 'package:roller_dice_app/message.dart';

class RollerDice extends StatefulWidget {
  const RollerDice({Key? key}) : super(key: key);

  @override
  State<RollerDice> createState() => _RollerDiceState();
}

class _RollerDiceState extends State<RollerDice> {
  final GlobalKey<_RollerDiceState> rootKey = GlobalKey<_RollerDiceState>();

  int diceNumber = 1;
  int count1 = 0;
  int count2 = 0;
  String winnerMessage = "\n\n";
  bool buttonState1 = true;
  bool buttonState2 = false;
  List<int> playerOneValues = [];
  List<int> playerTwoValues = [];
  num total1 = 0;
  num total2 = 0;

  void findWinner(List playerOneValues, List playerTwoValues) {
    for (int i = 0; i < playerOneValues.length; i++) {
      total1 += playerOneValues[i];
      total2 += playerTwoValues[i]!;

      winnerMessage += "${playerOneValues[i]} > ${playerTwoValues[i]} "
          "Winner ${playerOneValues[i] > playerTwoValues[i] ? 'Player One' : playerOneValues[i] == playerTwoValues[i] ? 'Draw' : 'Player Two'}\n";
    }

    winnerMessage +=
        total1 > total2 ? '\n\nWinner Player One' : '\n\nWinner Player Two';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Message(winnerMessage: winnerMessage);
      },
    );
  }

  void rollDice(bool isPlayerOne) {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      if (isPlayerOne) {
        buttonState2 = true;
        buttonState1 = false;
        playerOneValues.add(diceNumber);
        count1++;
      } else {
        buttonState1 = true;
        buttonState2 = false;
        playerTwoValues.add(diceNumber);
        count2++;
        if (count2 >= 5 && count1 >= 5) {
          buttonState1 = false;
          buttonState2 = false;
          findWinner(playerOneValues, playerTwoValues);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 45,),
        Text('Round : $count1',style: const TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
        const SizedBox(height: 30,),
        Image.asset(
          'assets/images/dice-$diceNumber.png',
          width: 200,
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: buttonState1 ? () => rollDice(true) : null,
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 25, 106, 172),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(12)
              ),
              child:
                  const Text("Player One Roll", style: TextStyle(fontSize: 22)),
            ),
            const SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: buttonState2 ? () => rollDice(false) : null,
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 25, 106, 172),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(12)
              ),
              child:
                  const Text("Player Two Roll", style: TextStyle(fontSize: 22)),
            ),
          ],
        ),
        const SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => RollerDiceApp(key: rootKey)),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 25, 106, 172),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(15)
            ),
            child: const Text(
              'Play Again',
              style: TextStyle(fontSize: 25),
            ),
          ),
        )
      ],
    );
  }
}
