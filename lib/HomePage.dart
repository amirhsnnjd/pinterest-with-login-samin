import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Provider/Album_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'Albums/AlbumList.dart';
import 'Images.dart';
import 'LoginPage.dart';
import 'Provider/Shared.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Album_provider>(context);
    final album = data.Album;
    return Consumer<shared>(
      builder: (context, value, child) {
        value.initial();
        value.set(true);
        return FutureBuilder<AlbumList>(
            future: album,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: new ThemeData(
                      scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
                      primarySwatch: Colors.grey,
                      primaryColor: Colors.grey),
                  home: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.black,
                      title: Row(
                        children: [
                          FloatingActionButton(
                            heroTag: "btn1",
                            onPressed: () =>
                                {value.set(false), Navigator.of(context).pop()},
                            backgroundColor: Colors.black,
                            child: const Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  color: Colors.white,
                                  child: Center(
                                      child: Text(
                                    "  For you",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                )),
                          ),
                        ],
                      ),
                    ),
                    bottomNavigationBar: Container(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: BottomNavigationBar(
                        unselectedLabelStyle:
                            TextStyle(fontWeight: FontWeight.bold),
                        type: BottomNavigationBarType.fixed,
                        backgroundColor: Colors.black,
                        unselectedItemColor: Colors.grey,
                        items: <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.home,
                            ),
                            label: 'Home',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.search),
                            label: 'Search',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.notifications),
                            label: 'Notifiation',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.person),
                            label: 'Saved',
                          )
                        ],
                      ),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView(children: [
                        StaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 25,
                          crossAxisSpacing: 7,
                          axisDirection: AxisDirection.down,
                          children: [
                            for (int i = 0;
                                i < snapshot.data!.albums.length;
                                i++)
                              Images(
                                snapshot.data!.albums[i],
                              ),
                          ],
                        )
                      ]),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const SpinKitRotatingCircle(
                color: Colors.red,
                size: 50.0,
              );
            }));
      },
    );
  }
}
