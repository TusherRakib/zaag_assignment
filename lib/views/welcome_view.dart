import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:zaag_assignment/views/favourite_item_page.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends StatelessWidget {
   WelcomeView({super.key});

  WelcomeController controller = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "HEY! WELCOME BACK",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Image.asset(
                "assets/ic_hand.png",
                height: 28,
                width: 28,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Obx(()=>controller.selectedItems.isEmpty? const Center(
                child: Text(
                  "No items to show now.\n Please add some favorite items to see here.",
                  textAlign: TextAlign.center,
                ),
              ): ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.selectedItems.length,
                itemBuilder: (context, index) {
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
                                    controller.selectedItems[index].image ?? "",
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
                                            text: controller.selectedItems[index].name ?? "",
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
                                            text: controller.selectedItems[index].shareSource ?? "",
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
                               InkWell(
                                  onTap: () {
                                    controller.selectedItems.removeWhere((element) => element.id == controller.selectedItems[index].id);
                                  },
                                  child: Image.asset(
                                    "assets/ic_heart_red.png",
                                    height: 15,
                                    width: 15,

                              ))
                            ],
                          ),
                          const SizedBox(height: 10,),
                          const Text(
                              'Share Description: ',
                              style: TextStyle(
                                color: Color(0xff8790AB),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),

                          Text(
                            controller.selectedItems[index].description ?? "",
                            style: TextStyle(
                              color: const Color(0xff3A3A3A).withOpacity(0.88),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ));
                },
              ),),
              Positioned(
                  bottom: 0,
                  child: Container(
                    width: Get.width,
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        controller.selectedItems.value = await Get.to(FavouriteItemsView());
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                          backgroundColor: const Color(0xff3A3A3A),
                      ),
                      child: const Text("Add Favorite Items",
                        style: TextStyle(fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),),
                    ),
                  ))
            ],
          ),
        ));
  }
}
