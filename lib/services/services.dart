import 'dart:convert';

import 'package:coin_base/model/home_model.dart';
import 'package:coin_base/widgets/app_url.dart';
import 'package:http/http.dart' as http;

//COIN NAME
class TickerName {
  Future<Data> getTickersApi() async {
    final response = await http.get(
      Uri.parse(AppUrl.homeUrl),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Data.fromJson(data);
    } else {
      throw Exception("Fetching error while calling API");
    }
  }
}
