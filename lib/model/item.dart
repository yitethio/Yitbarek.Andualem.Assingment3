class Item {
  String foodTitle;
  String foodDescription;
  String image;
  num foodPrice;

  Item(
      {required this.foodTitle,
      required this.foodDescription,
      required this.foodPrice,
      required this.image});

  factory Item.fromjson(Map<String, dynamic> parsedjson) {
    return Item(
        foodTitle: parsedjson["title"],
        foodDescription: parsedjson["description"],
        foodPrice: parsedjson["price"],
        image: parsedjson["image"]);
  }
  static List? itemList(List item) {
    List items = [];
    for (var i = 0; i < item.length; i++) {
      print(item);
      items.add(Item.fromjson(item[i]));
    }
    return items;
  }
}
