import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Albums/AlbumList.dart';
import 'package:flutter_application_1/LoginAlbum/AlbumList_L.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';
import 'Provider/Album_provider.dart';

ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color.fromARGB(255, 250, 250, 250),
    primarySwatch: Colors.red);

class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  var user = "";
  AsyncSnapshot<AlbumList_L> snapshot;
  LoginPage(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _darkTheme,
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Form(
            key: _formkey,
            child: Column(
              children: [
                //username text
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 80, 0, 0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "username",
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
                        errorStyle: TextStyle(color: Colors.red, fontSize: 16),
                        hintStyle: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 163, 157, 157))),
                    validator: ((value) {
                      if (value!.isEmpty || value == null)
                        return ('username is empty');
                      else {
                        user = value;
                        return null;
                      }
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
                        errorStyle: TextStyle(color: Colors.red, fontSize: 16),
                        hintStyle: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 163, 157, 157))),
                    validator: ((value) {
                      int p = 0;
                      for (int i = 0; i < snapshot.data!.albums.length; i++) {
                        if (user == snapshot.data!.albums[i].username) {
                          if (value == snapshot.data!.albums[i].id.toString())
                            p = 1;
                        }
                      }
                      if (p == 0)
                        return "password is wrong";
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
                          if (_formkey.currentState!.validate()) {
                            ChangeNotifierProvider<Album_provider>(
                                create: (context) => Album_provider(),
                                child: HomePage());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          }
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
            ),
          )),
    );
  }
}
