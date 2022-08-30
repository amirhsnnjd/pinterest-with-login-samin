import 'package:flutter/material.dart';
import 'package:flutter_application_1/Provider/Album_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'LoginAlbum/AlbumList_L.dart';
import 'LoginPage.dart';
import 'Provider/Login_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Login_provider>(
        create: (context) => Login_provider(),
      ),
      ChangeNotifierProvider<Album_provider>(
        create: (context) => Album_provider(),
      ),
    ],
    child: MaterialApp(home: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Login_provider>(context);
    final album = data.Album;
    return FutureBuilder<AlbumList_L>(
        future: album,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return LoginPage(snapshot);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const SpinKitRotatingCircle(
            color: Colors.red,
            size: 50.0,
          );
        }));
  }
}
