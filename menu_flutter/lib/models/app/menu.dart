class Menu {
  Menu({required this.id, required this.text, required this.restaurantId});

  int id;
  String text;
  int restaurantId;

  static Menu fromJson(dynamic obj) {
    return Menu(
      id: obj['id'],
      text: obj['text'],
      restaurantId: obj['restaurant_id']
    );
  }
}
