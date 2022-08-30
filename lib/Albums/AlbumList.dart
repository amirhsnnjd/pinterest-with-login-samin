import 'Album.dart';

class AlbumList {
  final List<Album> albums;
  const AlbumList({required this.albums});

  factory AlbumList.FromJson(List<dynamic> ParsedJson) {
    List<Album> albums;
    albums = ParsedJson.map((e) => Album.FromJson(e)).toList();
    return new AlbumList(albums: albums);
  }
}
