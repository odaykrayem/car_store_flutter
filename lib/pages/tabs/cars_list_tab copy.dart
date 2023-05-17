import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../controllers/cars/car_controller.dart';
import '../../routes/routes.dart';
import '../../shared/constants/ColorConstants.dart';
import '../../shared/widgets/customDialog.dart';

// ignore: must_be_immutable
class CarsTab1 extends StatefulWidget {
  CarsTab1({Key? key}) : super(key: key);

  @override
  State<CarsTab1> createState() => _CarsTabState();
}

class _CarsTabState extends State<CarsTab1> {
  CarController controller = Get.find<CarController>();
  void _loadResources() {
    controller.getCars();
  }

  bool isFilterClicked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showFilterModal());
  }

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
              }, childCount: controller.tempCars.length)
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
                itemCount: controller.tempCars.length,
                itemBuilder: (context, index) {
                  return _buildCarItem(index, theme);
                },
              ),
            )));
  }

  Widget _buildCarItem(int index, ThemeData theme) {
    return Container(
      padding: EdgeInsets.all(controller.tempCars[index].vip == 0 ? 0 : 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: controller.tempCars[index].vip == 0
            ? null
            : const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/gold_border.png')),
      ),
      margin: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
      child: GestureDetector(
        onTap: () {
          // Get.toNamed('/car/${controller.cars[index].id}');
          Get.toNamed(Routes.getCarPage(controller.tempCars[index].id));
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
                          child: controller.tempCars[index].image == 'image'
                              ? Image.asset(
                                  'assets/images/car3.png',
                                  // fit: BoxFit.cover,
                                )
                              : CachedNetworkImage(
                                  imageUrl: controller.tempCars[index].image,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        controller.tempCars[index].vip == 0
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
                      Text(controller.tempCars[index].name,
                          style: theme.textTheme.titleMedium),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(controller.tempCars[index].city_enname,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                      color: ColorConstants.gray200)),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "${controller.tempCars[index].price}\$",
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
                                      controller.tempCars[index].phone);
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

  _showFilterModal() {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.all(16),
      height: 600,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select a Theme",
            // style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 32),
          ListTile(
            leading: const Icon(
              Icons.brightness_5,
              color: Colors.blue,
            ),
            title: Text(
              "Light",
              //  style: theme.textTheme.bodyLarge,
            ),
            onTap: () {
              Get.back();
            },
            trailing: Icon(
              Icons.check,
              color: Colors.transparent,
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(
              Icons.brightness_2,
              color: Colors.orange,
            ),
            title: Text(
              "Dark",
              // style: theme.textTheme.bodyLarge,
            ),
            onTap: () {
              Get.back();
            },
            trailing: Icon(
              Icons.check,
              color: Colors.transparent,
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(
              Icons.brightness_6,
              color: Colors.blueGrey,
            ),
            title: Text(
              "System",
              // style: theme.textTheme.bodyLarge,
            ),
            onTap: () {
              Get.back();
            },
            trailing: Icon(
              Icons.check,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    ));
  }
}
