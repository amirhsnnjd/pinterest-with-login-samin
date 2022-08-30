class Geo{
   final String lat;
  final String lng;
  
  const Geo({
    required this.lat,
    required this.lng,


  });

  factory Geo.FromJson(Map<String, dynamic> json) {
    return Geo(
        lat: json['lat'],
        lng: json['lng'],

        );
  }
}