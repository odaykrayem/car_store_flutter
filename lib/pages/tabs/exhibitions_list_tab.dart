import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/exhibitions/exhibition_controller.dart';
import '../../routes/routes.dart';
import '../../shared/constants/ColorConstants.dart';

// ignore: must_be_immutable
class ExhibitionsTab extends GetView<ExhibitionController> {
  ExhibitionsTab({Key? key}) : super(key: key);

  void _loadResources() {
    controller.getExhibitions();
  }

  bool isFilterClicked = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          Obx(() => SliverAppBar(
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(
                      controller.isFilterClicked.value ? 60 : 0),
                  child: !controller.isFilterClicked.value
                      ? const SizedBox.shrink()
                      : Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: Get.isDarkMode
                                    ? ColorConstants.gray600
                                    : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10)),
                            child: Wrap(
                              spacing: 5.0,
                              // runSpacing: 10.0,
                              direction: Axis.horizontal,
                              // crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                _buildFilterItem(controller.cities[0].tr, 0),
                                _buildFilterItem(controller.cities[1].tr, 1),
                                _buildFilterItem(controller.cities[2].tr, 2),
                                _buildFilterItem(controller.cities[3].tr, 3),
                              ], //LIST OF ITEMS
                            ),
                          ),
                        )),
              floating: true,
              pinned: true,
              backgroundColor: ColorConstants.gray450,
              title: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? ColorConstants.gray600
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  onChanged: (text) {
                    controller.getExhibitionByName(text);
                  },
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    hintText: "Search E.g Exhibition Name",
                    // suffixIcon: Padding(
                    //   padding: const EdgeInsets.all(5.0),
                    //   child: Container(
                    //     width: 40,
                    //     decoration: BoxDecoration(
                    //         color: Get.isDarkMode
                    //             ? ColorConstants.gray900
                    //             : Colors.grey.shade300,
                    //         borderRadius: BorderRadius.circular(10)),
                    //     child: Center(
                    //       child: IconButton(
                    //         onPressed: () {
                    //           controller.setFilterClicked();
                    //         },
                    //         icon: const Icon(
                    //           IconlyLight.filter,
                    //           color: Colors.grey,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ),
                ),
              ))),
          Obx(
            () => Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: Colors.greenAccent)),
              child: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return _buildExhibitionItem(index, theme);
              }, childCount: controller.tempExhibitions.length)
                  //  SliverChildListDelegate(

                  //   [
                  //     Container(
                  //         height: double.maxFinite,
                  //         child: _buildExhibitionsList(context, theme))
                  //   ],

                  // ),
                  ),
            ),
          )
        ],
      ),
    ));
  }

  Widget _buildFilterItem(String title, int index) {
    return GestureDetector(
      onTap: () {
        controller.selectCity(index);
      },
      child: Chip(
        label: Text(title),
        backgroundColor: controller.selectedCity.value == index
            ? ColorConstants.darkGreen1
            : ColorConstants.gray300,
      ),
    );
  }

  Widget _buildExhibitionsList(BuildContext context, ThemeData theme) {
    return RefreshIndicator(
        color: Colors.greenAccent,
        onRefresh: () async {
          _loadResources();
        },
        // child: Text(''),
        child: Obx(() => Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: Colors.greenAccent)),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(), // new

                padding: const EdgeInsets.only(left: 16),
                scrollDirection: Axis.vertical,
                itemCount: controller.tempExhibitions.length,
                itemBuilder: (context, index) {
                  return _buildExhibitionItem(index, theme);
                },
              ),
            )));
  }

  Widget _buildExhibitionItem(int index, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
      child: GestureDetector(
        onTap: () {
          // Get.toNamed('/car/${controller.cars[index].id}');
          Get.toNamed(
              Routes.getExhibitionPage(controller.tempExhibitions[index].id));
        },
        child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Get.isDarkMode
                  ? ColorConstants.gray700
                  : Colors.grey.shade200,
              border: Border.all(
                  color: Get.isDarkMode
                      ? Colors.transparent
                      : Colors.grey.shade200,
                  width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    color: ColorConstants.gray100,
                    height: 150,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Image.asset(
                            'assets/images/car_store.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(110),
                            ),
                          ),
                        )
                      ],
                    )

                    //  Image.asset(
                    //   'assets/images/car_store.png',
                    //   // fit: BoxFit.cover,
                    // )
                    // CachedNetworkImage(
                    //   imageUrl:
                    //       controller.cars[index].image,
                    //   fit: BoxFit.cover,
                    // ),
                    ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(controller.tempExhibitions[index].name,
                                style: theme.textTheme.titleMedium),
                            const SizedBox(
                              height: 5,
                            ),
                            // Text('{region}',
                            //     style: theme.textTheme.bodyMedium?.copyWith(
                            //         color: ColorConstants.green)),
                            // const SizedBox(
                            //   height: 8,
                            // ),
                            Text(
                              "${controller.tempExhibitions[index].details}",
                              // overflow: TextOverflow.fade,
                              maxLines: 2,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                  // decoration:
                                  //     TextDecoration.lineThrough,
                                  color: ColorConstants.gray200),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   height: 35,
                      //   width: 35,
                      //   decoration: BoxDecoration(
                      //     color: ColorConstants.green,
                      //     borderRadius: BorderRadius.circular(90),
                      //   ),
                      //   child: Center(
                      //     child: IconButton(
                      //       icon: const Icon(
                      //         IconlyLight.more_circle,
                      //       ),
                      //       iconSize: 20,
                      //       onPressed: () {},
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
