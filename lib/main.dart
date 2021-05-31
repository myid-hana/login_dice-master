import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 50)),
            Center(
              child: Image(
                image: AssetImage('image/chef.gif'),
                width: 170,
                height: 190,
              ),
            ),
            Form(
                child: Theme(
              data: ThemeData(
                  primaryColor: Colors.teal, //input underline color
                  inputDecorationTheme: InputDecorationTheme(
                      //input label style
                      labelStyle: TextStyle(color: Colors.teal, fontSize: 15))),
              child: Container(
                padding: EdgeInsets.all(
                    40), //container 는 하나의 child 밖에 가질 수 없으므로 column 을 불러온다.
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Enter "dice"' //input label
                          ),
                      keyboardType: TextInputType.emailAddress, //키보드 타입
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Enter Password' //input label
                          ),
                      keyboardType: TextInputType.text, //키보드 타입
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonTheme(
                      minWidth: 100,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green),),
                        child: Text(
                          'login',
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
