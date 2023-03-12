import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/item.dart';

class ApiServiceProvider {
  Future<List?> fetchActivity() async {
    print("9090");
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      return Item.itemList(json.decode(response.body));
    } else {
      print("i am hear");
      throw Exception('Failed to load');
    }
  }
}
