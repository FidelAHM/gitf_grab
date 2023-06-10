import 'package:flutter/material.dart';
import 'package:gift_grab/constants/globals.dart';
import 'package:gift_grab/games/gift_grab_game.dart';
import 'package:gift_grab/screens/game_play.dart';
import 'package:gift_grab/screens/menus/menu_background_widget.dart';

class GameOverMenu extends StatelessWidget {
  final GiftGrabGame gameRef;
  const GameOverMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuBackgroundWidget(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Text(
                'Game Over',
                style: TextStyle(
                  fontSize: Globals.isTablet ? 100 : 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Text(
                'Score: ${gameRef.score}',
                style: TextStyle(
                  fontSize: Globals.isTablet ? 100 : 50,
                ),
              ),
            ),
            SizedBox(
              width: Globals.isTablet ? 400 : 200,
              height: Globals.isTablet ? 100 : 50,
              child: ElevatedButton(
                onPressed: () {
                  gameRef.removeMenu(menu: Menu.gameOver);
                  gameRef.reset();
                  gameRef.resumeEngine();
                },
                child: Text(
                  'Play Again?',
                  style: TextStyle(
                    fontSize: Globals.isTablet ? 50 : 25,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: Globals.isTablet ? 400 : 200,
              height: Globals.isTablet ? 100 : 50,
              child: ElevatedButton(
                onPressed: () {
                  gameRef.removeMenu(menu: Menu.gameOver);
                  gameRef.reset();
                  gameRef.addMenu(menu: Menu.main);
                },
                child: Text(
                  'Main Menu',
                  style: TextStyle(
                    fontSize: Globals.isTablet ? 50 : 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
