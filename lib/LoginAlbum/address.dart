import 'Geo.dart';

class Address{
   final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;


  
 const Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,

  });

  factory Address.FromJson(Map<String, dynamic> json) {
    return Address(
        street: json['street'],
        suite: json['suite'],
        city: json['city'],
        zipcode: json['zipcode'],
        geo: Geo.FromJson(json['geo']),

        );
  }
}