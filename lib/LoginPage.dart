import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color.fromARGB(255, 250, 250, 250),
    primarySwatch: Colors.red);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _darkTheme,
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              //username text
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 80, 0, 0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Username",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
              //Username FromField
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: TextFormField(
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your username',
                      errorStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 163, 157, 157))),
                  validator: ((value) {
                    if (value!.isEmpty ||
                        value == null ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value))
                      return ('username is wrong');
                    else
                      return null;
                  }),
                ),
              ),
              //Password Text
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
              //Password FromField
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: TextFormField(
                  obscureText: true,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your Password',
                      errorStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 163, 157, 157))),
                  validator: ((value) {
                    if (value!.isEmpty ||
                        value == null ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value))
                      return ('password is wrong');
                    else
                      return null;
                  }),
                ),
              ),
              //Log in button
              Container(
                height: 70,
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ElevatedButton(
                      onPressed: () {
                        print("");
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              ),
              //forgot button
              TextButton(
                  onPressed: null,
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(fontSize: 17),
                  )),
            ],
          )),
    );
  }
}
