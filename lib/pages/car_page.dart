// ignore_for_file: unused_import
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../controllers/cars/car_controller.dart';
import '../../models/cars/car_model.dart';
import '../../shared/constants/ColorConstants.dart';
import '../../shared/widgets/CommonWidgets.dart';
import '../../shared/widgets/customDialog.dart';

class CarPage extends GetView<CarController> {
  const CarPage(this.id, {Key? key}) : super(key: key);
  final int? id;

  @override
  Widget build(BuildContext context) {
    debugPrint('car build');
    // debugPrint(Get.parameters['id']);

    if (id == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    controller.fetchCar(id!);

    final theme = Theme.of(context);
    final isDarkMode = Get.isDarkMode;

    return controller.obx((state) {
      if (state == null) {
        return _isLoading(isDarkMode: isDarkMode);
      }

      return _build(
          context: context, car: state, theme: theme, isDarkMode: isDarkMode);
    }, onLoading: _isLoading(isDarkMode: isDarkMode));
  }

  Widget _build(
      {required BuildContext context,
      required CarModel car,
      required ThemeData theme,
      required bool isDarkMode}) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: CustomScrollView(slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(
              color: ColorConstants.green, //change your color here
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.7,
            elevation: 0,
            snap: true,
            floating: true,
            stretch: true,
            backgroundColor: ColorConstants.gray200,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
              ],
              background: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: car.image == 'image'
                        ? Image.asset(
                            'assets/images/carbig.png',
                            fit: BoxFit.contain,
                          )
                        : CachedNetworkImage(
                            imageUrl: car.image,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                _isLoading(isDarkMode: isDarkMode),
                            errorWidget: (context, url, error) =>
                                _isLoading(isDarkMode: isDarkMode),
                          ),
                  ),
                  car.vip == 0
                      ? const SizedBox.shrink()
                      : const Positioned(
                          top: 30,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              IconlyLight.shield_done,
                              color: Color(0xffffd700),
                              size: 40,
                            ),
                          ),
                        )
                ],
              ),
              //
              // background: Image.network(product.image, fit: BoxFit.cover,)
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(45),
                child: Transform.translate(
                  offset: const Offset(0, 1),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      color:
                          Get.isDarkMode ? Colors.grey.shade900 : Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Center(
                        child: Container(
                      width: 50,
                      height: 8,
                      decoration: BoxDecoration(
                        color: ColorConstants.green,
                        // color: Get.isDarkMode
                        //     ? Colors.grey.shade700
                        //     : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
                  ),
                )),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                height: MediaQuery.of(context).size.height * 0.70,
                color: Get.isDarkMode ? Colors.grey.shade900 : Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Theme(
                  //Inherit the current Theme and override only the accentColor property
                  data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.fromSwatch()
                          .copyWith(secondary: Colors.greenAccent)),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          car.company,
                          style: TextStyle(
                            color: ColorConstants.green,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(car.name,
                            style: theme.textTheme.displaySmall!
                                .copyWith(fontSize: 22)),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              car.price.toString() + '.00\$',
                              style: theme.textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: ColorConstants.green,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                height: 35,
                                child: Center(
                                  child: IconButton(
                                    icon: const Icon(
                                      IconlyLight.call,
                                    ),
                                    iconSize: 20,
                                    onPressed: () {
                                      showCustomDialog(
                                          'phoneNumber'.tr, car.phone);
                                    },
                                  ),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstants.gray200, width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // _title('', theme),
                                    _feautreItem(
                                        'Region : ', car.city_enname, theme),
                                    _feautreItem('Phone : ', car.phone, theme),

                                    // _feautreItem('Exhibition : ', car.make, theme),
                                    _feautreItem('Make : ', car.make, theme),
                                    _feautreItem(
                                        'Class : ', car.class_s, theme),
                                    _feautreItem('Model : ', car.model, theme),
                                    _feautreItem('Type : ', car.type, theme),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstants.gray200, width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _title('Performance', theme),
                                    _feautreItem('Transmission : ',
                                        car.transmission, theme),
                                    _feautreItem('Cylinders : ',
                                        '${car.cylinders}', theme),
                                    _feautreItem('Fuel : ', car.fuel, theme),
                                    _feautreItem(
                                        'Engine : ', car.engine, theme),
                                    _feautreItem('Horse power : ',
                                        car.horsepower, theme),
                                    _feautreItem('Turbo : ', car.turbo, theme),
                                    _feautreItem('Wheel Drive System : ',
                                        car.wheel_drive_system, theme),
                                    _feautreItem('Vehicle Height Control : ',
                                        car.vehicle_height_control, theme),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstants.gray200, width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _title('History & Conditions', theme),
                                    _feautreItem('Vehicle Body Type : ',
                                        car.body_type, theme),
                                    _feautreItem('Import From : ',
                                        car.import_from, theme),
                                    _feautreItem(
                                        'Status : ', car.status, theme),
                                    _feautreItem(
                                        'Warranty : ', car.warranty, theme),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstants.gray200, width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _title('Interior', theme),
                                    _feautreItem('Windows Type : ',
                                        car.window_type, theme),
                                    _feautreItem('Air Bags : ',
                                        '${car.air_bags}', theme),
                                    _feautreItem(
                                        'Screen : ', '${car.screen}', theme),
                                    _feautreItem('Gps Navigation System : ',
                                        car.gps, theme),
                                    _feautreItem(
                                        'Fridge : ', car.fridge, theme),
                                    _feautreItem('Number Of Seats : ',
                                        '${car.seats}', theme),
                                    _feautreItem(
                                        'Hud System : ', car.hud_system, theme),
                                    _feautreItem('Sound System : ',
                                        car.sound_system, theme),
                                    _feautreItem(
                                        'Seats Type : ', car.seats_type, theme),
                                    _feautreItem(
                                        'Slide Roof : ', car.slide_roof, theme),
                                    _feautreItem('Seats Color : ',
                                        car.seats_color, theme),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstants.gray200, width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _title('Exterior', theme),
                                    _feautreItem('Figerprint Door : ',
                                        car.finger_door, theme),
                                    _feautreItem(
                                        'Sensors : ', car.sensors, theme),
                                    _feautreItem(
                                        'Camera : ', car.camera, theme),
                                    _feautreItem('Wheel Size : ',
                                        '${car.wheel_size}', theme),
                                    _feautreItem('Lamps : ', car.lamps, theme),
                                    _feautreItem(
                                        'Auto Park : ', car.auto_park, theme),
                                    _feautreItem('Adaptive Cruise Control : ',
                                        car.cruise_control, theme),
                                    _feautreItem('Lane Keep Assist : ',
                                        car.lane_keep_assist, theme),
                                    _feautreItem(
                                        'Mirror : ', car.mirror, theme),
                                    _feautreItem('Color : ', car.color, theme),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // MaterialButton(
                        //   onPressed: () {
                        //     Navigator.pop(context);
                        //   },
                        //   height: 50,
                        //   elevation: 0,
                        //   splashColor: Colors.green[700],
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(10)),
                        //   color: Colors.green[800],
                        //   child: const Center(
                        //     child: Text(
                        //       "Add to Cart",
                        //       style:
                        //           TextStyle(color: Colors.white, fontSize: 18),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ))
          ])),
        ]),
      ),
    );
  }

  Widget _feautreItem(String title, String value, ThemeData theme) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: theme.textTheme.titleSmall,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              value,
              style: theme.textTheme.titleSmall,
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }

  Widget _isLoading({required bool isDarkMode}) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _title(String title, ThemeData theme) {
    return Column(
      children: [
        Text(
          title.toUpperCase(),
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
