import 'Album_L.dart';

class AlbumList_L {
  final List<Album_L> albums;
  const AlbumList_L({required this.albums});

  factory AlbumList_L.FromJson(List<dynamic> ParsedJson) {
    List<Album_L> albums;
    albums = ParsedJson.map((e) => Album_L.FromJson(e)).toList();
    return new AlbumList_L(albums: albums);
  }
}
