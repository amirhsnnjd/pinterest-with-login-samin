import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'Albums/Album.dart';

class PhotoPage extends StatelessWidget {
  Album snapshot;
  PhotoPage(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
          primarySwatch: Colors.grey,
          primaryColor: Colors.grey),
      home: Scaffold(
          body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 320, 0),
                child: FloatingActionButton(
                  heroTag: "btn1",
                  onPressed: () => Navigator.of(context).pop(),
                  backgroundColor: Colors.black,
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.75,
                child: Image.network(
                  snapshot.image,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  snapshot.title +
                      "\n\r \n\r price : " +
                      snapshot.price.toString() +
                      "\$",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "\r\n" + snapshot.description,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
