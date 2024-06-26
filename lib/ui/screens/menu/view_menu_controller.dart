import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:host/ui/screens/menu/menu_category_response.dart';
import 'package:host/ui/screens/menu/menu_item_list_respoonse.dart';

import '../../../network/app_repo.dart';

class ViewMenuController extends GetxController {
  final isLoading = true.obs;
  final isDataLoading = false.obs;
  final listMenuCategory = <MenuCategoryBean>[].obs;
  final listMenuItem = <MenuItemBean>[].obs;

  @override
  void onReady() {
    super.onReady();
    getMenuCategory();
  }

  getMenuCategory() async {
    try {
      final response = await AppRepo()
          .getMenuCategory(ceremonyId: '659d857b475ea7f333987868');

      listMenuCategory.addAll(response.data ?? []);
      if (listMenuCategory.isNotEmpty) {
        listMenuCategory[0].isSelected.value = true;

        getMenuItemList(listMenuCategory[0].catId ?? '', true);
      }
    } on Exception catch (e) {
      isLoading.value = false;
    }
  }

  getMenuItemList(categoryId, isFirstTime) async {
    if (!isFirstTime) isDataLoading.value = true;
    listMenuItem.clear();
    try {
      final response =
          await AppRepo().getMenuItems(categoryId: '65acd124a33faa4e84e103bf');

      listMenuItem.addAll(response.data ?? []);

      isLoading.value = false;
      isDataLoading.value = false;
    } on Exception catch (e) {
      isLoading.value = false;
      isDataLoading.value = false;
    }
  }

  onTabClick(currIndex) {
    var prevIndex = listMenuCategory
        .indexWhere((element) => element.isSelected.value == true);
    debugPrint(prevIndex.toString());
    debugPrint(currIndex.toString());
    listMenuCategory[prevIndex].isSelected.value = false;
    listMenuCategory[currIndex].isSelected.value = true;
    listMenuCategory.refresh();

    getMenuItemList(listMenuCategory[currIndex].catId, false);
  }
}
