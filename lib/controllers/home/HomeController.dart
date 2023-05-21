// ignore_for_file: file_names
import 'package:car_store_flutter/shared/constants/ColorConstants.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:car_store_flutter/pages/tabs/cars_list_tab.dart';
import 'package:car_store_flutter/pages/tabs/ExploreTab.dart';
import 'package:car_store_flutter/pages/tabs/exhibitions_list_tab.dart';
import 'package:car_store_flutter/pages/tabs/UserTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import '../../models/cities/city_model.dart';
import '../../models/comapny_models.dart/company_models.dart';
import '../../models/companies/company_model.dart';
import '../../models/companies_test/company.dart';
import '../../models/exhibitions/exhibition_model.dart';
import '../../models/cars/car_model.dart';
import '../../providers/car_provider.dart';
import '../../providers/city_provider.dart';
import '../../providers/company_models_provider.dart';
import '../../providers/company_provider.dart';
import '../../providers/exhibition_provider.dart';
import '../../pages/tabs/info_tab.dart';
import '../../repositories/car_repository.dart';
import '../../repositories/filter_types.dart';
import '../cars/car_controller.dart';

class HomeController extends GetxController {
  final CarProvider _carProvider;

  HomeController(this._carProvider);

  late PageController pageController;
  late CarouselController normalBannerController;
  late CarouselController vipBannerController;
  late AdvancedDrawerController advancedDrawerController;

  // late CategoryProvider _categoryProvider = Get.find();
  late ExhibitionProvider _exhibitionProvider = Get.find();
  late CityProvider _cityProvider = Get.find();
  late CompanyProvider _companyProvider = Get.find();
  late CompanyModelsProvider _companyModelsProvider = Get.find();
  late CarController _carController = Get.find<CarController>();

  // late CarProvider _carProvider = Get.find();

  var currentPage = 0.obs;
  var currentNormalBanner = 0.obs;
  var currentVIPBanner = 0.obs;
  var cars = <CarModel>[].obs;
  var bannerCars = <CarModel>[].obs;
  var vipCars = <CarModel>[].obs;
  var stores = <ExhibitionModel>[].obs;

  var bannerLoaded = false.obs;
  var carsLoaded = false.obs;
  var vipBannerLoaded = false.obs;

  //Filter
  int defaultMinPrice = 0;
  int defaultMaxPrice = 300000;
  int defaultMinDate = 1950;
  int defaultMaxDate = 2025;

  var minPrice = 0.obs;
  var maxPrice = 0.obs;
  var minDate = 0.obs;
  var maxDate = 0.obs;
  var selectedCity = 0.obs;
  var selectedCompany = 0.obs;
  var selectedCompanyModel = 0.obs;
  var selectedStore = 0.obs;
  var companies = <Company>[].obs;
  var companyModels = <CompanyModels>[].obs;
  var cities = <CityModel>[].obs;

  List<Widget> pages = [
    const ExploreTab(),
    CarsTab(),
    ExhibitionsTab(),
    UserTab(),
    const InfoTab(),
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    normalBannerController = CarouselController();
    vipBannerController = CarouselController();
    advancedDrawerController = AdvancedDrawerController();
    Get.put(CarController(Get.find()));

    getCars();
    getBannerCars();
    getVIPCars();
    getStores();
    getCompanies();
    getCities();

    initFilter();
    super.onInit();
  }

  void getCars() {
    _carProvider.getCars().then((cars) {
      carsLoaded.value = true;
      this.cars.value = cars;
      debugPrint(cars.toString());
    });
  }

  void getCompanies() {
    _companyProvider.getCompanies().then((comps) {
      // carsLoaded.value = true;
      companies.value = comps;
      debugPrint(companies.toString());
    });
  }

  void getCompanyModels(int id) {
    _companyModelsProvider.getCompanies(id).then((comps) {
      // carsLoaded.value = true;
      companyModels.value = comps;
      debugPrint(companies.toString());
    });
  }

  void getCities() {
    _cityProvider.getCities().then((cities) {
      // carsLoaded.value = true;
      this.cities.value = cities;
      debugPrint(cars.toString());
      selectCity(-1);
    });
  }

  void getBannerCars() {
    _carProvider.getBannerCars().then((items) {
      bannerLoaded.value = true;
      bannerCars.value = items;
      debugPrint(bannerCars.toString());
    });
  }

  void getVIPCars() {
    _carProvider.getVIPcars().then((items) {
      vipBannerLoaded.value = true;

      vipCars.value = items;
      debugPrint(stores.toString());
    });
  }

  void getStores() {
    _exhibitionProvider.getStores().then((items) {
      stores.value = items;
      debugPrint(stores.toString());
    });
  }

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
    if (page == 1) showFilterModal();
  }

  void changeNormalBanner(int index) {
    currentNormalBanner.value = index;
  }

  void changeVIPBanner(int index) {
    currentVIPBanner.value = index;
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  showFilterModal() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        height: Get.height - 150,
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            )),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              // automaticallyImplyLeading: false,

              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${'filterBy'.tr} :',
                    style: const TextStyle(fontSize: 18),
                  ),
                  clearFilterButton()
                ],
              ),
              pinned: true,
              floating: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                filterItem(title: 'price'.tr, children: [
                  Obx(() => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('from'.tr),
                              NumberPicker(
                                value: minPrice.value,
                                minValue: defaultMinPrice,
                                maxValue: 299000,
                                step: 1000,
                                selectedTextStyle:
                                    TextStyle(color: ColorConstants.green),
                                haptics: true,
                                onChanged: (value) {
                                  minPrice.value = value;
                                },
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Colors.black26),
                                ),
                              ),
                              Text('to'.tr),
                              NumberPicker(
                                value: maxPrice.value,
                                minValue: 5000,
                                maxValue: defaultMaxPrice,
                                step: 1000,
                                selectedTextStyle:
                                    TextStyle(color: ColorConstants.green),
                                haptics: true,
                                onChanged: (value) {
                                  maxPrice.value = value;
                                },
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Colors.black26),
                                ),
                              ),
                            ],
                          ),
                          filterButton(
                            data: {
                              'min': minPrice.value,
                              'high': maxPrice.value
                            },
                            filterType: FilterTypes.price,
                          )
                        ],
                      )),
                ]),
                filterItem(title: 'date'.tr, children: [
                  Obx(() => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('from'.tr),
                              NumberPicker(
                                value: minDate.value,
                                minValue: defaultMinDate,
                                maxValue: defaultMaxDate,
                                step: 1,
                                selectedTextStyle:
                                    TextStyle(color: ColorConstants.green),
                                haptics: true,
                                onChanged: (value) {
                                  minDate.value = value;
                                },
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Colors.black26),
                                ),
                              ),
                              Text('to'.tr),
                              NumberPicker(
                                value: maxDate.value,
                                minValue: defaultMinDate,
                                maxValue: defaultMaxDate,
                                step: 1,
                                selectedTextStyle:
                                    TextStyle(color: ColorConstants.green),
                                haptics: true,
                                onChanged: (value) {
                                  maxDate.value = value;
                                },
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Colors.black26),
                                ),
                              ),
                            ],
                          ),
                          filterButton(
                            data: {'min': minDate.value, 'high': maxDate.value},
                            filterType: FilterTypes.year,
                          )
                        ],
                      )),
                ]),
                filterItem(title: 'city'.tr, children: [
                  Obx(() => Column(
                        children: [
                          Wrap(
                              spacing: 5.0,
                              direction: Axis.horizontal,
                              children: cities
                                  .map((element) => _buildCityChipItem(
                                      element.city_enname.tr,
                                      cities.indexOf(element)))
                                  .toList()
                              // [
                              //   _buildCityChipItem(cities[0].city_enname.tr, 0),
                              //   _buildCityChipItem(cities[1].city_enname.tr, 1),
                              //   _buildCityChipItem(cities[2].city_enname.tr, 2),
                              //   _buildCityChipItem(cities[3].city_enname.tr, 3),
                              // ],
                              ),
                          filterButton(
                            data: {
                              'id': selectedCity.value == -1
                                  ? 0
                                  : cities[selectedCity.value]
                            },
                            filterType: FilterTypes.city,
                          )
                        ],
                      ))
                ]),
                ExpansionTile(
                  title: Text('company'.tr),
                  textColor: ColorConstants.green,
                  iconColor: ColorConstants.green,
                  children: [
                    Obx(() => Column(
                          children: [
                            Wrap(
                              children: companies
                                  .map((element) => ExpansionTile(
                                        childrenPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 3),
                                        tilePadding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        title: Text(element.name),
                                        textColor: ColorConstants.green,
                                        iconColor: ColorConstants.green,
                                        onExpansionChanged: (isExpanded) {
                                          selectedCompany.value = element.id;
                                          debugPrint(
                                              'selected company ${element.id}');
                                        },
                                        children: element.models
                                            .map(
                                              (element) => RadioListTile(
                                                  selectedTileColor:
                                                      ColorConstants.green,
                                                  activeColor:
                                                      ColorConstants.green,
                                                  value: element.id,
                                                  title: Text(element.name),
                                                  groupValue:
                                                      selectedCompanyModel
                                                          .value,
                                                  onChanged: (val) {
                                                    selectedCompanyModel.value =
                                                        val!;
                                                    debugPrint(
                                                        'selected model${selectedCompanyModel.value}');
                                                  }),
                                            )
                                            .toList(),
                                      ))
                                  .toList(),
                            ),
                            filterButton(
                              // data: {
                              //   'model_id': selectedCompanyModel.value,
                              //   'company_id': selectedCompany.value
                              // },
                              data: {
                                'id': selectedCompanyModel.value,
                              },
                              filterType: FilterTypes.model,
                            )
                          ],
                        )),
                  ],
                ),
                filterItem(title: 'exhibition'.tr, children: [
                  Obx(() => Column(
                        children: [
                          Wrap(
                            children: stores
                                .map((element) => RadioListTile(
                                    selectedTileColor: ColorConstants.green,
                                    activeColor: ColorConstants.green,
                                    value: element.id,
                                    title: Text(element.name),
                                    groupValue: selectedStore.value,
                                    onChanged: (val) =>
                                        selectedStore.value = val!))
                                .toList(),
                          ),
                          filterButton(
                            data: {'id': selectedStore.value},
                            filterType: FilterTypes.exhibition,
                          ),
                        ],
                      )),
                ]),
                const SizedBox(
                  height: 90,
                ),
              ]),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget filterItem({required String title, required List<Widget> children}) {
    return ExpansionTile(
      title: Text(title),
      textColor: ColorConstants.green,
      iconColor: ColorConstants.green,
      children: children,
    );
  }

  Widget filterButton({
    required FilterTypes filterType,
    required Map<String, dynamic> data,
  }) {
    return MaterialButton(
      color: ColorConstants.green,
      onPressed: () {
        switch (filterType) {
          case FilterTypes.year:
            _carController.filterCars(
              filterType: FilterTypes.year,
              data: {
                'low': data['min'],
                'high': data['high'],
              },
            );
            break;
          case FilterTypes.price:
            _carController.filterCars(
              filterType: FilterTypes.price,
              data: {
                'low': data['min'],
                'high': data['high'],
              },
            );
            break;
          case FilterTypes.company:
            _carController.filterCars(filterType: FilterTypes.company, data: {
              'id': data['id'],
            });
            break;
          case FilterTypes.model:
            _carController.filterCars(filterType: FilterTypes.model, data: {
              'id': data['id'],
            });
            break;
          case FilterTypes.city:
            {
              if (data['cityId'] == 0) return;
              _carController.filterCars(
                filterType: FilterTypes.city,
                data: {
                  'id': data['id'],
                },
              );
            }
            break;
          case FilterTypes.exhibition:
            _carController
                .filterCars(filterType: FilterTypes.exhibition, data: {
              'id': data['id'],
            });
            break;
          case FilterTypes.companyModel:
            // TODO: Handle this case.
            break;
        }
      },
      child: Text('filter'.tr),
    );
  }

  Widget clearFilterButton() {
    return MaterialButton(
      color: ColorConstants.green,
      onPressed: () {
        initFilter();
        _carController.clearFilter();
      },
      child: Text(
        'clearFilters'.tr,
      ),
    );
  }

  void initFilter() {
    minPrice.value = defaultMinPrice;
    maxPrice.value = defaultMaxPrice;
    minDate.value = defaultMinDate;
    maxDate.value = defaultMaxDate;
    selectedCity.value = -1;
    selectedStore.value = 0;
    selectedCompany.value = 0;
  }

  Widget _buildCityChipItem(String title, int index) {
    return GestureDetector(
      onTap: () {
        selectCity(index);
      },
      child: Chip(
        label: Text(title),
        backgroundColor: selectedCity.value == index
            ? ColorConstants.darkGreen1
            : ColorConstants.gray300,
      ),
    );
  }

  void selectCity(int index) {
    if (index == -1) {
      selectedCity.value = index;
      return;
    }
    selectedCity.value = index;
  }
}
