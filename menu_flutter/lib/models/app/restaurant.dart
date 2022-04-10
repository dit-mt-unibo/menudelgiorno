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
  int street_number;
  int postcode;
  String city;
  String province;

  static Restaurant fromJson(dynamic obj) {
    return Restaurant(
      id: obj['registry']['id'],
      name: obj['name'] ?? '',
      address: obj['address'] ?? '',
      street_number: obj['street_number'] ?? '',
      postcode: obj['post_code'] ?? '',
      city: obj['city'] ?? '',
      province: obj['province'] ?? '',
    );
  }
}
