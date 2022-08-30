import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/LoginAlbum/AlbumList_L.dart';
import 'package:http/http.dart' as http;
import '../LoginAlbum/AlbumList_L.dart';

class Login_provider with ChangeNotifier {
  late Future<AlbumList_L> album = FetchAlbum();

  Future<AlbumList_L> FetchAlbum() async {
    final _response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (_response.statusCode == 200)
      return AlbumList_L.FromJson(jsonDecode(_response.body));
    else
      throw Exception("error");
  }

  Future<AlbumList_L> get Album {
    return album;
  }
}
