import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaag_assignment/controllers/favourite_item_controller.dart';
import 'package:zaag_assignment/models/favourite_items_model.dart';
import 'package:zaag_assignment/models/selected_item_model.dart';

class FavouriteItemsView extends StatelessWidget {
  FavouriteItemsView({super.key});

  FavouriteItemController controller = Get.put(FavouriteItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search"),
          leading: IconButton(
            onPressed: () {
              Get.back(result: controller.selectedItems);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Obx(() => controller.isDataLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                  labelText: 'Search',
                                ),
                                onChanged: (value) {
                                  controller.searchQuery.value = value;
                                  controller.search();
                                },
                              ),
                            ))),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      itemCount: controller.searchQuery.value == "" ? controller.favouriteItemsModel?.lists?.length : controller.searchItemList.length,
                      itemBuilder: (context, index) {
                        ListElement? item = controller.searchQuery.value == "" ? controller.favouriteItemsModel!.lists![index] : controller.searchItemList[index];
                        return favouriteItem(item);
                      },
                    ),
                    // Obx(() => controller.searchQuery.value == ""?
                    // showFavouriteItemList(): showSearchItemList())
                  ],
                ),
              )));
  }

  Widget favouriteItem(ListElement? item) {
    return Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xff8790ab29).withOpacity(0.16),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                      item?.owner?.profileImage ?? "",
                      height: 64,
                      width: 64,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                              text: 'Name: ',
                              style: TextStyle(
                                color: Color(0xff8790AB),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),
                          TextSpan(
                              text: item?.owner?.name ?? "",
                              style: TextStyle(
                                color: const Color(0xff3A3A3A).withOpacity(0.88),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    SizedBox(
                      width: Get.width / 1.8,
                      child: RichText(
                        softWrap: true,
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                                text: 'Share Source: ',
                                style: TextStyle(
                                  color: Color(0xff8790AB),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                            TextSpan(
                              text: item?.share?.shareSource ?? "",
                              style: TextStyle(
                                color: const Color(0xff3A3A3A).withOpacity(0.88),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Obx(() => InkWell(
                      onTap: () {
                        if (controller.selectedItems.any((element) => element.id == item?.id)) {
                          controller.selectedItems.removeWhere((element) => element.id == item?.id);
                        } else {
                          controller.selectedItems.add(SelectedItemsModel(
                            id: item?.id,
                            name: item?.owner?.name,
                            image: item?.owner?.profileImage,
                            shareSource: item?.share?.shareSource,
                            description: item?.share?.shareDescription,
                          ));
                        }
                      },
                      child: controller.selectedItems.any((element) => element.id == item?.id)
                          ? Image.asset(
                              "assets/ic_heart_red.png",
                              height: 15,
                              width: 15,
                            )
                          : Image.asset(
                              "assets/ic_heart_outlined.png",
                              height: 15,
                              width: 15,
                            ),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Share Description: ',
                style: TextStyle(
                  color: Color(0xff8790AB),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )),
            Text(
              item?.share?.shareDescription ?? "",
              style: TextStyle(
                color: const Color(0xff3A3A3A).withOpacity(0.88),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ));
  }

  // Widget showFavouriteItemList(){
  //   return ListView.builder(
  //     shrinkWrap: true,
  //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //     itemCount: controller.favouriteItemsModel?.lists?.length,
  //     itemBuilder: (context, index) {
  //       return Container(
  //           padding: const EdgeInsets.all(15),
  //           decoration: BoxDecoration(
  //               border: Border.all(
  //                 color: const Color(0xff8790ab29).withOpacity(0.16),
  //               ),
  //               borderRadius: const BorderRadius.all(Radius.circular(12))),
  //           margin: const EdgeInsets.symmetric(vertical: 10),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   ClipRRect(
  //                       borderRadius: BorderRadius.circular(60),
  //                       child: Image.network(
  //                         controller.favouriteItemsModel?.lists?[index].owner?.profileImage ?? "",
  //                         height: 64,
  //                         width: 64,
  //                       )),
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       RichText(
  //                         text: TextSpan(
  //                           children: <TextSpan>[
  //                             const TextSpan(
  //                                 text: 'Name: ',
  //                                 style: TextStyle(
  //                                   color: Color(0xff8790AB),
  //                                   fontSize: 14,
  //                                   fontWeight: FontWeight.w400,
  //                                 )),
  //                             TextSpan(
  //                                 text: controller.favouriteItemsModel?.lists?[index].owner?.name ?? "",
  //                                 style: TextStyle(
  //                                   color: const Color(0xff3A3A3A).withOpacity(0.88),
  //                                   fontSize: 14,
  //                                   fontWeight: FontWeight.w500,
  //                                 )),
  //                           ],
  //                         ),
  //                       ),
  //                       const SizedBox(
  //                         height: 3,
  //                       ),
  //                       SizedBox(
  //                         width: Get.width / 1.8,
  //                         child: RichText(
  //                           softWrap: true,
  //                           text: TextSpan(
  //                             children: <TextSpan>[
  //                               const TextSpan(
  //                                   text: 'Share Source: ',
  //                                   style: TextStyle(
  //                                     color: Color(0xff8790AB),
  //                                     fontSize: 14,
  //                                     fontWeight: FontWeight.w400,
  //                                   )),
  //                               TextSpan(
  //                                 text: controller.favouriteItemsModel?.lists?[index].share?.shareSource ?? "",
  //                                 style: TextStyle(
  //                                   color: const Color(0xff3A3A3A).withOpacity(0.88),
  //                                   fontSize: 14,
  //                                   fontWeight: FontWeight.w500,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                           maxLines: 3,
  //                           overflow: TextOverflow.ellipsis,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Obx(() => InkWell(
  //                     onTap: () {
  //                       if (controller.selectedItems.any((element) => element.id == controller.favouriteItemsModel?.lists?[index].id)) {
  //                         controller.selectedItems.removeWhere((element) => element.id == controller.favouriteItemsModel?.lists?[index].id);
  //                       } else {
  //                         controller.selectedItems.add(SelectedItemsModel(
  //                           id: controller.favouriteItemsModel?.lists?[index].id,
  //                           name: controller.favouriteItemsModel?.lists?[index].owner?.name,
  //                           image: controller.favouriteItemsModel?.lists?[index].owner?.profileImage,
  //                           shareSource: controller.favouriteItemsModel?.lists?[index].share?.shareSource,
  //                           description: controller.favouriteItemsModel?.lists?[index].share?.shareDescription,
  //                         ));
  //                       }
  //                     },
  //                     child: controller.selectedItems.any((element) => element.id == controller.favouriteItemsModel?.lists?[index].id)
  //                         ? Image.asset(
  //                       "assets/ic_heart_red.png",
  //                       height: 15,
  //                       width: 15,
  //                     )
  //                         : Image.asset(
  //                       "assets/ic_heart_outlined.png",
  //                       height: 15,
  //                       width: 15,
  //                     ),
  //                   ))
  //                 ],
  //               ),
  //               const SizedBox(
  //                 height: 10,
  //               ),
  //               const Text('Share Description: ',
  //                   style: TextStyle(
  //                     color: Color(0xff8790AB),
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w400,
  //                   )),
  //               Text(
  //                 controller.favouriteItemsModel?.lists?[index].share?.shareDescription ?? "",
  //                 style: TextStyle(
  //                   color: const Color(0xff3A3A3A).withOpacity(0.88),
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //             ],
  //           ));
  //     },
  //   );
  // }
  // Widget showSearchItemList (){
  //   return ListView.builder(
  //     shrinkWrap: true,
  //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //     itemCount: controller.searchItemList.length,
  //     itemBuilder: (context, index) {
  //       return Container(
  //           padding: const EdgeInsets.all(15),
  //           decoration: BoxDecoration(
  //               border: Border.all(
  //                 color: const Color(0xff8790ab29).withOpacity(0.16),
  //               ),
  //               borderRadius: const BorderRadius.all(Radius.circular(12))),
  //           margin: const EdgeInsets.symmetric(vertical: 10),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   ClipRRect(
  //                       borderRadius: BorderRadius.circular(60),
  //                       child: Image.network(
  //                         controller.searchItemList[index].owner?.profileImage ?? "",
  //                         height: 64,
  //                         width: 64,
  //                       )),
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       RichText(
  //                         text: TextSpan(
  //                           children: <TextSpan>[
  //                             const TextSpan(
  //                                 text: 'Name: ',
  //                                 style: TextStyle(
  //                                   color: Color(0xff8790AB),
  //                                   fontSize: 14,
  //                                   fontWeight: FontWeight.w400,
  //                                 )),
  //                             TextSpan(
  //                                 text: controller.searchItemList[index].owner?.name ?? "",
  //                                 style: TextStyle(
  //                                   color: const Color(0xff3A3A3A).withOpacity(0.88),
  //                                   fontSize: 14,
  //                                   fontWeight: FontWeight.w500,
  //                                 )),
  //                           ],
  //                         ),
  //                       ),
  //                       const SizedBox(
  //                         height: 3,
  //                       ),
  //                       SizedBox(
  //                         width: Get.width / 1.8,
  //                         child: RichText(
  //                           softWrap: true,
  //                           text: TextSpan(
  //                             children: <TextSpan>[
  //                               const TextSpan(
  //                                   text: 'Share Source: ',
  //                                   style: TextStyle(
  //                                     color: Color(0xff8790AB),
  //                                     fontSize: 14,
  //                                     fontWeight: FontWeight.w400,
  //                                   )),
  //                               TextSpan(
  //                                 text: controller.searchItemList[index].share?.shareSource ?? "",
  //                                 style: TextStyle(
  //                                   color: const Color(0xff3A3A3A).withOpacity(0.88),
  //                                   fontSize: 14,
  //                                   fontWeight: FontWeight.w500,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                           maxLines: 3,
  //                           overflow: TextOverflow.ellipsis,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Obx(() => InkWell(
  //                     onTap: () {
  //                       if (controller.selectedItems.any((element) => element.id == controller.searchItemList[index].id)) {
  //                         controller.selectedItems.removeWhere((element) => element.id == controller.searchItemList[index].id);
  //                       } else {
  //                         controller.selectedItems.add(SelectedItemsModel(
  //                           id: controller.searchItemList[index].id,
  //                           name: controller.searchItemList[index].owner?.name,
  //                           image: controller.searchItemList[index].owner?.profileImage,
  //                           shareSource: controller.searchItemList[index].share?.shareSource,
  //                           description: controller.searchItemList[index].share?.shareDescription,
  //                         ));
  //                       }
  //                     },
  //                     child: controller.selectedItems.any((element) => element.id == controller.favouriteItemsModel?.lists?[index].id)
  //                         ? Image.asset(
  //                       "assets/ic_heart_red.png",
  //                       height: 15,
  //                       width: 15,
  //                     )
  //                         : Image.asset(
  //                       "assets/ic_heart_outlined.png",
  //                       height: 15,
  //                       width: 15,
  //                     ),
  //                   ))
  //                 ],
  //               ),
  //               const SizedBox(
  //                 height: 10,
  //               ),
  //               const Text('Share Description: ',
  //                   style: TextStyle(
  //                     color: Color(0xff8790AB),
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w400,
  //                   )),
  //               Text(
  //                 controller.favouriteItemsModel?.lists?[index].share?.shareDescription ?? "",
  //                 style: TextStyle(
  //                   color: const Color(0xff3A3A3A).withOpacity(0.88),
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //             ],
  //           ));
  //     },
  //   );
  // }
}
