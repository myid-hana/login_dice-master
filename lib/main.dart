import 'package:flutter/material.dart';
import 'Dice.dart';

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
  TextEditingController controller =
      TextEditingController(); //Textfield 에 입력되는 값 가져오기 위한 컨트롤러
  TextEditingController controller2 = TextEditingController();

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
      body: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          }, //전체 포커스를 해제해서 노출되어 있는 키보드를 다시 아래로 내림.
          child: SingleChildScrollView(
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
                          labelStyle:
                              TextStyle(color: Colors.teal, fontSize: 15))),
                  child: Container(
                    padding: EdgeInsets.all(
                        40), //container 는 하나의 child 밖에 가질 수 없으므로 column 을 불러온다.
                    child: Column(
                      children: [
                        TextField(
                          autofocus: true,
                          controller: controller, //컨트롤러 설정해주기.
                          decoration: InputDecoration(
                              labelText: 'Enter "dice"' //input label
                              ),
                          keyboardType: TextInputType.emailAddress, //키보드 타입
                        ),
                        TextField(
                          controller: controller2,
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
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                            ),
                            child: Text(
                              'login',
                            ),
                            onPressed: () {
                              //조건에 따라 페이지 이동
                              if (controller.text == 'dice' &&
                                  controller2.text == '1234') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Dice()));
                              } else if (controller.text != 'dice') {
                                showSnackBar2(context);
                              } else if (controller2.text != '1234') {
                                showSnackBar3(context);
                              }
                            },
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
      }),
    );
  }
}

void showSnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
        content: Text(
          '로그인 정보를 다시 확인하세요.',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.pink),
  );
}

void showSnackBar2(BuildContext context) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
        content: Text(
          '아이디가 일치하지 않습니다.',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.pink),
  );
}

void showSnackBar3(BuildContext context) {
  // ignore: deprecated_member_use
  Scaffold.of(context).showSnackBar(
    SnackBar(
        content: Text(
          '비밀번호가 일치하지 않습니다.',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.pink),
  );
}
