import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/calendar_screen/Model/schedule_model.dart';

class SpendingBudgetProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();
  Map<String , dynamic> spendingBudgetData = {};
  bool isLoading = false;
  Future<void> getSpendingBudget() async {
    isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.getSpendingBudget();
      if (response.statusCode == 200) {
        isLoading = false;
        spendingBudgetData = response.data;
        notifyListeners();
      }
    } catch (error) {
      isLoading = false;
      notifyListeners();
      log("Error fetching scheduleModelData: $error");
    } finally {
      print("its final ");
      notifyListeners();
    }
  }


  bool isBudgetSetLoading = false;
  Future<void> budgetSet({required String price , required String categoryID}) async {
    isBudgetSetLoading = true;
    notifyListeners();
    Map<String , dynamic> body ={
      'category_id': categoryID,
      'budget': price
    };
    try {
      Response response = await _apiService.setBudget(params: body);
      if (response.statusCode == 200) {
        isBudgetSetLoading = false;
        getSpendingBudget();
        Get.back();
        FlutterToast.toastMessage(message: "Budget set Successfully");
        notifyListeners();
      }
    } catch (error) {
      isBudgetSetLoading = false;
      notifyListeners();
      log("Error fetching scheduleModelData: $error");
    } finally {
      isBudgetSetLoading = false;
      print("its final ");
      notifyListeners();
    }
  }




  bool isAddCategoryLoading = false;
  Future<void> addUserCategory({
    required String categoryName,
    required String price,
    required String providerName,
    XFile? categoryImage,
    XFile? providerImage,
  }) async {
    FormData formData = FormData.fromMap({
      'category_name': categoryName,
      'price': price,
      'provider_name': providerImage,
    });

    if (categoryImage != null) {
      formData.files.add(MapEntry(
        'category_image',
        await MultipartFile.fromFile(categoryImage.path.toString(), filename: categoryImage.path.split('/').last),
      ));
    }
    if (providerImage != null) {
      formData.files.add(MapEntry(
        'provider_image',
        await MultipartFile.fromFile(providerImage.path.toString(), filename: providerImage.path.toString().split('/').last),
      ));
    }

    try {
      Response response = await _apiService.addCategories(params: formData);
      if (response.statusCode == 200) {
        FlutterToast.toastMessage(message: "Category added successfully");
        Get.back();
        // Get.to(() => SubscriptionInfo(subscriptionInfoData: {}));
        if (kDebugMode) {
          print("hit successfully");
        }
      } else {

        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    } catch (error) {

      print("this is error ${error.toString()}");
    }
  }



  bool isAddProviderInUserCategoryLoading = false;
  Future<void> addProviderInUserCategory({    XFile? providerImage,required String providerName , required String categoryID}) async {
    isAddProviderInUserCategoryLoading = true;
    notifyListeners();
    FormData formData = FormData.fromMap({
      'name': providerName,
      'category_id': categoryID
    });
    if (providerImage != null) {
      formData.files.add(MapEntry(
        'image',
        await MultipartFile.fromFile(providerImage.path.toString(), filename: providerImage.path.toString().split('/').last),
      ));
    }

    try {
      Response response = await _apiService.addProviderInUserCategory(params: formData);
      if (response.statusCode == 200) {
        isAddProviderInUserCategoryLoading = false;
        getSpendingBudget();
        Get.back();
        FlutterToast.toastMessage(message: "Provider added Successfully");
        notifyListeners();
      }
    } catch (error) {
      isAddProviderInUserCategoryLoading = false;
      notifyListeners();
      log("Error fetching scheduleModelData: $error");
    } finally {
      isAddProviderInUserCategoryLoading = false;
      print("its final ");
      notifyListeners();
    }
  }


}