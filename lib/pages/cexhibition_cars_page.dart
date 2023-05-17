import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../../routes/routes.dart';
import '../../../shared/constants/ColorConstants.dart';
import '../../controllers/cars/store_cars_controller.dart';
import '../../models/cars/car_model.dart';
import '../../shared/widgets/customDialog.dart';

// ignore: must_be_immutable
class ExhibitionPage extends GetView<StoreCarsController> {
  ExhibitionPage(this.id, {Key? key}) : super(key: key);

  final int? id;

  bool isFilterClicked = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (id == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    controller.getStoreCars(id!);

    final isDarkMode = Get.isDarkMode;

    return controller.obx((state) {
      if (state == null) {
        return _isLoading(isDarkMode: isDarkMode);
      }

      return _build(
          context: context, cars: state, theme: theme, isDarkMode: isDarkMode);
    }, onLoading: _isLoading(isDarkMode: isDarkMode));
  }

  Widget _build(
      {required BuildContext context,
      required List<CarModel> cars,
      required ThemeData theme,
      required bool isDarkMode}) {
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
                    controller.getCarByName(text);
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      hintText: "Search E.g Car Name",
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 40,
                          decoration: BoxDecoration(
                              color: Get.isDarkMode
                                  ? ColorConstants.gray900
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                controller.setFilterClicked();
                              },
                              icon: const Icon(
                                IconlyLight.filter,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
              ))),
          Obx(
            () => Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: Colors.greenAccent)),
              child: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return _buildCarItem(index, theme);
              }, childCount: controller.storeCars.length)
                  //  SliverChildListDelegate(

                  //   [
                  //     Container(
                  //         height: double.maxFinite,
                  //         child: _buildCarsList(context, theme))
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

  Widget _buildCarsList(BuildContext context, ThemeData theme) {
    return RefreshIndicator(
        color: Colors.greenAccent,
        onRefresh: () async {},
        // child: Text(''),
        child: Obx(() => Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: Colors.greenAccent)),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(), // new

                padding: const EdgeInsets.only(left: 16),
                scrollDirection: Axis.vertical,
                itemCount: controller.storeCars.length,
                itemBuilder: (context, index) {
                  return _buildCarItem(index, theme);
                },
              ),
            )));
  }

  Widget _buildCarItem(int index, ThemeData theme) {
    return Container(
      padding: EdgeInsets.all(controller.storeCars[index].vip == 0 ? 0 : 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: controller.storeCars[index].vip == 0
            ? null
            : const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/gold_border.png')),
      ),
      margin: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
      child: GestureDetector(
        onTap: () {
          // Get.toNamed('/car/${controller.cars[index].id}');
          Get.toNamed(Routes.getCarPage(controller.storeCars[index].id));
        },
        child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Get.isDarkMode
                  ? ColorConstants.gray700
                  : Colors.grey.shade200,
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
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: controller.storeCars[index].image == 'image'
                              ? Image.asset(
                                  'assets/images/car3.png',
                                  // fit: BoxFit.cover,
                                )
                              : CachedNetworkImage(
                                  imageUrl: controller.storeCars[index].image,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        controller.storeCars[index].vip == 0
                            ? const SizedBox.shrink()
                            : const Positioned(
                                top: 0,
                                left: 0,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    IconlyLight.shield_done,
                                    color: Color(0xffffd700),
                                  ),
                                ),
                              )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.storeCars[index].name,
                          style: theme.textTheme.titleMedium),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(controller.storeCars[index].city_enname,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                      color: ColorConstants.gray200)),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "${controller.storeCars[index].price}\$",
                                style: theme.textTheme.bodyLarge?.copyWith(
                                    // decoration:
                                    //     TextDecoration.lineThrough,
                                    color: ColorConstants.green),
                              )
                            ],
                          ),
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: ColorConstants.green,
                              borderRadius: BorderRadius.circular(90),
                            ),
                            child: Center(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.call,
                                ),
                                iconSize: 20,
                                onPressed: () {
                                  showCustomDialog('phoneNumber'.tr,
                                      controller.storeCars[index].phone);
                                },
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget _isLoading({required bool isDarkMode}) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
