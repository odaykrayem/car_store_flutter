import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/exhibitions/exhibition_model.dart';
import '../../providers/exhibition_provider.dart';

class ExhibitionController extends GetxController with StateMixin {
  final ExhibitionProvider _exhibitionProvider;

  var exhibitions = <ExhibitionModel>[];
  var tempExhibitions = <ExhibitionModel>[].obs;
  var isFilterClicked = false.obs;
  var cities = <String>[].obs;
  var selectedCity = 0.obs;

  ExhibitionController(this._exhibitionProvider);

  @override
  void onInit() {
    getExhibitions();
    buildCitiesList();
    super.onInit();
  }

  void getExhibitions() {
    _exhibitionProvider.getStores().then((exhibitions) {
      this.exhibitions = exhibitions;
      tempExhibitions.value = [...exhibitions];
      debugPrint(exhibitions.toString());
    });
  }

  void setFilterClicked() {
    if (isFilterClicked.value) {
      selectCity(-1);
    }
    isFilterClicked.value = !isFilterClicked.value;
  }

  void buildCitiesList() {
    cities.value = [
      'baghdad',
      'erbil',
      'dohuk',
      'suleymaniyah',
    ];
  }

  void selectCity(int index) {
    if (index == -1) {
      selectedCity.value = index;
      var tExhibitions = <ExhibitionModel>[];
      tExhibitions = [...exhibitions];

      tempExhibitions.assignAll(tExhibitions.toList());
      return;
    }
    selectedCity.value = index;

    debugPrint('city :  ${cities.value[index]}');
    debugPrint('exhibitions length : ${exhibitions.length}');
    // getExhibitionByRegion(cities[index]);
  }

  void fetchExhibition(int id) async {
    if (exhibitions.isEmpty) {
      _exhibitionProvider.getStores().then((exhibitions) {
        this.exhibitions = exhibitions;
        var exhibition = exhibitions.firstWhere((element) => element.id == id);

        change(exhibition, status: RxStatus.success());
        debugPrint('fetch all exhibitions');
      });
    } else {
      debugPrint('fetch one exhibition');

      var exhibition = exhibitions.firstWhere((element) => element.id == id);

      change(exhibition, status: RxStatus.success());
    }

    // _exhibitionProvider.getExhibitionById(id).then((exhibition) {
    //   change(exhibition, status: RxStatus.success());
    // }).catchError((error) {
    //   change(null, status: RxStatus.error(error));
    // });
  }

  void getExhibitionByName(String name) {
    debugPrint('search');
    debugPrint('temp : ${tempExhibitions.length}');
    debugPrint('anotehr : ${exhibitions.length}');
    if (name.isEmpty) {
      getExhibitions();
    }
    var tExhibitions = <ExhibitionModel>[];
    tExhibitions = [...exhibitions];

    tempExhibitions.assignAll(tExhibitions
        .where((element) =>
            element.name.toLowerCase().contains(name.toLowerCase()))
        .toList());
  }

  // void getExhibitionByRegion(String region) {
  //   // getExhibitions();
  //   debugPrint('search');
  //   debugPrint('temp : ${tempExhibitions.length}');
  //   debugPrint('anotehr : ${exhibitions.length}');
  //   var ttExhibitions = <ExhibitionModel>[];
  //   ttExhibitions = [...exhibitions];
  //   debugPrint('temp : ${ttExhibitions.length}');
  //   debugPrint('region : ${region}');

  //   tempExhibitions.assignAll(ttExhibitions
  //       .where((element) =>
  //           element.region.toLowerCase().contains(region.toLowerCase()))
  //       .toList());
  //   debugPrint('temp : ${tempExhibitions.toString()}');
  // }
}
