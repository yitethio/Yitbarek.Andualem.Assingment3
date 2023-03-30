class Item {
  int id;
  String foodTitle;
  String foodDescription;
  String image;
  num foodPrice;

  Item({
    required this.id,
    required this.foodTitle,
    required this.foodDescription,
    required this.foodPrice,
    required this.image,
  });

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
      id: parsedJson["id"],
      foodTitle: parsedJson["title"],
      foodDescription: parsedJson["description"],
      foodPrice: parsedJson["price"],
      image: parsedJson["image"],
    );
  }
  factory Item.historyfromJson(Map<String, dynamic> parsedJson) {
    return Item(
      id: parsedJson["id"],
      foodTitle: parsedJson["foodTitle"],
      foodDescription: parsedJson["foodDescription"],
      foodPrice: parsedJson["foodPrice"],
      image: parsedJson["image"],
    );
  }
  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['foodTitle'] = foodTitle;
    json['foodDescription'] = foodDescription;
    json['foodPrice'] = foodPrice;
    json['image'] = image;

    return json;
  }

  static List itemList(List item) {
    List items = [];
    for (var i = 0; i < item.length; i++) {
      items.add(Item.fromJson(item[i]));
    }
    return items;
  }

  static List historyList(List item) {
    List asbeza = [];
    for (var i = 0; i < item.length; i++) {
      asbeza.add(Item.historyfromJson(item[i]));
    }
    return asbeza;
  }
}
