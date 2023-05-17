// ignore_for_file: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_store_flutter/models/exhibitions/exhibition_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:car_store_flutter/controllers/home/HomeController.dart';
import 'package:car_store_flutter/shared/constants/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../models/cars/car_model.dart';
import '../../routes/routes.dart';
import '../../shared/widgets/customDialog.dart';

class ExploreTab extends GetView<HomeController> {
  const ExploreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            // _buildOfferIndicator(),
            // const SizedBox(
            //   height: 8,
            // ),
            _buildBanner(context, false),
            // _buildOfferIndicator(),
            const SizedBox(
              height: 16,
            ),
            _buildSection('exhibitions'.tr, theme, 2),
            const SizedBox(
              height: 8,
            ),
            _buildStores(theme),

            const SizedBox(
              height: 25,
            ),
            _buildVIPBanner(context, true),

            const SizedBox(
              height: 16,
            ),
            _buildSection('cars'.tr, theme, 1),
            const SizedBox(
              height: 8,
            ),
            _buildCarsList(theme),
            const SizedBox(
              height: 8,
            ),
          ]),
        ),
      ],
    ));
  }

  Widget _buildBanner(context, bool isVIP) {
    return Container(
      decoration: const BoxDecoration(),
      height: MediaQuery.of(context).size.height * 0.14,
      child: Obx(() => !controller.bannerLoaded.value
          ? const SizedBox.shrink()
          : CarouselSlider.builder(
              carouselController: controller.normalBannerController,
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: false,
                viewportFraction: 1,
                aspectRatio: 1,
                initialPage: 0,
                autoPlayAnimationDuration: Duration(seconds: isVIP ? 5 : 3),
                autoPlayInterval: Duration(seconds: isVIP ? 9 : 5),
                onPageChanged: (index, reason) =>
                    controller.changeNormalBanner(index),
              ),
              itemCount: controller.bannerLoaded.value
                  ? controller.bannerCars.length
                  : 0,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      _buildBannerItem(controller.bannerCars[itemIndex], false),
            )),
    );
  }

  Widget _buildVIPBanner(context, bool isVIP) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/gold_border.png')),
          border: Border.symmetric(
              horizontal: BorderSide(color: Colors.transparent, width: 4))),
      height: MediaQuery.of(context).size.height * 0.20,
      child: Obx(() => !controller.vipBannerLoaded.value
          ? const SizedBox.shrink()
          : CarouselSlider.builder(
              carouselController: controller.vipBannerController,
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: false,
                viewportFraction: 1,
                aspectRatio: 1,
                initialPage: 0,
                autoPlayAnimationDuration: Duration(seconds: isVIP ? 5 : 3),
                autoPlayInterval: Duration(seconds: isVIP ? 9 : 5),
                onPageChanged: (index, reason) =>
                    controller.changeVIPBanner(index),
              ),
              itemCount: controller.vipBannerLoaded.value
                  ? controller.vipCars.length
                  : 0,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      _buildBannerItem(controller.vipCars[itemIndex], true))),
    );
  }

  Widget _buildBannerItem(CarModel car, bool isVIP) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.getCarPage(car.id));
      },
      child: Container(
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        // margin: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          border: isVIP
              ? const Border.symmetric(
                  vertical: BorderSide(color: Color(0xffe8b736), width: 0.1))
              : Border.symmetric(
                  vertical:
                      BorderSide(color: ColorConstants.gray700, width: 0.5)),
          // color: Get.isDarkMode ? Colors.grey.shade100 : ColorConstants.gray100,
          color: Get.isDarkMode
              ? ColorConstants.gray100
              : ColorConstants.gray100.withOpacity(0.5),
        ),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/car1.png',
              width: double.infinity,
              // fit: BoxFit.cover,
            ),
            // CachedNetworkImage(
            //   width: double.infinity,
            //   imageUrl: car.image,
            //   fit: BoxFit.cover,
            // )
          ],
        ),
      ),
    );
  }

  Widget _buildOfferIndicator() {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: controller.bannerCars.asMap().entries.map((entry) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Get.isDarkMode ? Colors.white : Colors.blueGrey)
                      .withOpacity(controller.currentVIPBanner == entry.key
                          ? 0.9
                          : 0.2)),
            );
          }).toList(),
        ));
  }

  Widget _buildStore(ExhibitionModel store, index, theme) {
    return ZoomTapAnimation(
      beginDuration: const Duration(milliseconds: 300),
      endDuration: const Duration(milliseconds: 500),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(
            right: controller.stores.length - 1 == index ? 0 : 8),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.getExhibitionPage(store.id));
          },
          child: Stack(
            children: [
              SizedBox(
                width: 120,
                height: 60,
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
                  child: Center(
                    child: Text(
                      store.name,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.subtitle1
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, ThemeData theme, int i) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
                color: ColorConstants.white, fontWeight: FontWeight.w600),
          ),
          MaterialButton(
            onPressed: () {
              controller.goToTab(i);
            },
            minWidth: 50,
            splashColor: theme.primaryColor.withAlpha(10),
            highlightColor: theme.primaryColor.withAlpha(30),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
            child: Icon(
              Icons.arrow_forward,
              size: 20,
              color: ColorConstants.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStores(ThemeData theme) {
    return SizedBox(
      height: 60,
      child: Obx(() => ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: controller.stores.length,
            itemBuilder: (context, index) {
              return _buildStore(controller.stores[index], index, theme);
            },
          )),
    );
  }

  Widget _buildCarsList(ThemeData theme) {
    return SizedBox(
      height: 260,
      child: Obx(() => ListView.builder(
            // padding: const EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            itemCount: controller.cars.length,
            itemBuilder: (context, index) {
              return AspectRatio(
                  aspectRatio: 1, child: _buildCarItem(index, theme));
            },
          )),
    );
  }

  Widget _buildCarItem(int index, ThemeData theme) {
    return Container(
      padding: EdgeInsets.all(controller.cars[index].vip == 0 ? 0 : 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: controller.cars[index].vip == 0
            ? null
            : const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/gold_border.png')),
      ),
      margin: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
      child: GestureDetector(
        onTap: () {
          // Get.toNamed('/car/${controller.cars[index].id}');
          Get.toNamed(Routes.getCarPage(controller.cars[index].id));
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
                          child: controller.cars[index].image == 'image'
                              ? Image.asset(
                                  'assets/images/car3.png',
                                  // fit: BoxFit.cover,
                                )
                              : CachedNetworkImage(
                                  imageUrl: controller.cars[index].image,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        controller.cars[index].vip == 0
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
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.cars[index].name,
                          style: theme.textTheme.titleMedium),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(controller.cars[index].city_enname,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                      color: ColorConstants.gray200)),
                              // const SizedBox(
                              //   height: 4,
                              // ),
                              Text(
                                "${controller.cars[index].price}\$",
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
                                      controller.cars[index].phone);
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
}
