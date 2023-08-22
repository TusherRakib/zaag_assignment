import 'dart:developer';

import 'package:get/get.dart';

import '../models/selected_item_model.dart';


class WelcomeController extends GetxController {
  RxList<SelectedItemsModel> selectedItems = <SelectedItemsModel>[].obs;





  @override
  void onReady() {
    log("WelcomeController");
    super.onReady();
  }
}