import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text('Dice game'),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Image.asset('image/dice1.png')),
                  //Expanded: row에서는 가로로, column 에서는 세로로 이미지를 늘려줌.
                  SizedBox(width: 20),
                  Expanded(child: Image.asset('image/dice2.png')),
                ],
              ),
            ),
            ButtonTheme(
              minWidth: 100.0,
              height: 60.0,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    '주사위 굴리기',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(30, 10, 30, 10)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
