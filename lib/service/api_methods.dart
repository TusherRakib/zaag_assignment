import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/favourite_items_model.dart';

class ApiMethods {
  String baseurl = "https://list.ly/api/v4/lists/trending?page=1&per_page=10";
  Dio dio = Dio();

  Future<FavouriteItemsModel?> getFavouriteItems() async {
    FavouriteItemsModel favouriteItemsModel = FavouriteItemsModel();
    dynamic response = await dio.get(baseurl);

    if (response != null) {
      favouriteItemsModel = FavouriteItemsModel.fromJson(response.data);
      return favouriteItemsModel;
    } else {
      return null;
    }
  }
}
