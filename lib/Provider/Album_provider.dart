import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Albums/AlbumList.dart';

class Album_provider with ChangeNotifier {
  late Future<AlbumList> album = FetchAlbum();

  Future<AlbumList> FetchAlbum() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200)
      return AlbumList.FromJson(jsonDecode(response.body));
    else
      throw Exception("error");
  }

  Future<AlbumList> get Album {
    return album;
  }
}
