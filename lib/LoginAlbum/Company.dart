class Company{
   final String name;
  final String catchPhrase;
  final String bs;



 const Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.FromJson(Map<String, dynamic> json) {
    return Company(
        name: json['name'],
        catchPhrase: json['catchPhrase'],
        bs: json['bs'],
        );
  }
}