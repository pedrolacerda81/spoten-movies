import 'dart:math';

import 'package:flutter/material.dart';

class ComentListTile extends StatelessWidget {
  final Random random;
  const ComentListTile({
    Key key,
    @required this.random,
  }) : super(key: key);

  String _generateRandomComent() {
    final coment = random.nextInt(8);
    switch (coment) {
      case 0:
        return 'Uma m****!';
        break;
      case 1:
        return 'Maravilhoso! 🤩';
        break;
      case 2:
        return 'Ótimo filme!';
        break;
      case 3:
        return 'Bom.';
        break;
      case 4:
        return 'humm nháá!';
        break;
      case 5:
        return 'Alguem em 2020?';
        break;
      case 6:
        return 'Sou fã!';
        break;
      case 7:
        return 'nem assisti...';
        break;
      default:
        return 'sei lá q to fazendo aqui..';
        break;
    }
  }

  String _generateRandomName() {
    final coment = random.nextInt(4);
    switch (coment) {
      case 0:
        return 'Pedro Costa';
        break;
      case 1:
        return 'Manoel Fernandes';
        break;
      case 2:
        return 'Jonas Matos V.R.';
        break;
      case 3:
        return 'Sabrina H.';
      default:
        return 'Anônimo';
        break;
    }
  }

  String _generateRandomStarRate() {
    final coment = random.nextInt(5);
    switch (coment) {
      case 0:
        return '⭐️';
        break;
      case 1:
        return '⭐️⭐️';
        break;
      case 2:
        return '⭐️⭐️⭐️';
        break;
      case 3:
        return '⭐️⭐️⭐️⭐️';
      default:
        return '⭐️⭐️⭐️⭐️⭐️';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        title: Container(
          child: Row(
            children: [
              Text(
                '${_generateRandomName()} - ${_generateRandomStarRate()}',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        subtitle: Text(
          _generateRandomComent(),
          style: TextStyle(
            color: Colors.black54,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
