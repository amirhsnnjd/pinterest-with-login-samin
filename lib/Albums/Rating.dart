class Rating {
  final dynamic rate;
  final int count;

  const Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.FromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
