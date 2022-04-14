class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.street_number,
    required this.postcode,
    required this.city,
    required this.province,
  });

  int id;
  String name;
  String address;
  String street_number;
  String postcode;
  String city;
  String province;

  static Restaurant fromJson(dynamic obj) {
    return Restaurant(
      id: obj['restaurant']['id'],
      name: obj['restaurant']['name'] ?? '',
      address: obj['restaurant']['address'] ?? '',
      street_number: obj['restaurant']['street_number'] ?? '',
      postcode: obj['restaurant']['post_code'] ?? '',
      city: obj['restaurant']['city'] ?? '',
      province: obj['restaurant']['province'] ?? '',
    );
  }
}
