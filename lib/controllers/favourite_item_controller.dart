import 'package:get/get.dart';
import 'package:zaag_assignment/models/favourite_items_model.dart';
import 'package:zaag_assignment/service/api_methods.dart';

import '../models/selected_item_model.dart';

class FavouriteItemController extends GetxController{

  FavouriteItemsModel? favouriteItemsModel = FavouriteItemsModel();

  RxList<SelectedItemsModel> selectedItems = <SelectedItemsModel>[].obs;
  
  RxString searchQuery = "".obs;

  RxList<ListElement> searchItemList = <ListElement>[].obs;

  RxBool isDataLoading = true.obs;
  
  
  void search (){

    for(ListElement element in favouriteItemsModel!.lists!){
      if(element.owner?.name == searchQuery.value){
        searchItemList.add(element);
      }
    }
  }

  @override
  void onReady() {
    getFavItems();
  }

  Future<void> getFavItems () async {
    isDataLoading.value = true;
    favouriteItemsModel = await ApiMethods().getFavouriteItems();
    isDataLoading.value = false;
  }

}