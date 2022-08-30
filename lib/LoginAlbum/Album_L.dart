import 'Company.dart';
import 'address.dart';

class Album_L {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  const Album_L({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory Album_L.FromJson(Map<String, dynamic> json) {
    return Album_L(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.FromJson(json["address"]),
      phone: json['phone'],
      website: json['website'],
      company: Company.FromJson(json['company']),
    );
  }
}
