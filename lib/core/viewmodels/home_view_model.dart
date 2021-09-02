import 'package:ecommerceapp/core/services/home_service.dart';
import 'package:ecommerceapp/model/category_model.dart';
import 'package:ecommerceapp/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      value.forEach((element) {
        _categoryModel.add(CategoryModel.fromJson(element.data()));
        print(_categoryModel.length);
        _loading.value = false;
      });

      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getProducts().then((value) {
      value.forEach((element) {
        _productModel.add(ProductModel.fromJson(element.data()));
        _loading.value = false;
        print(productModel.length);
      });
      update();
    });
  }
}
