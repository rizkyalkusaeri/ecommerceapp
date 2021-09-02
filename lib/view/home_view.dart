import 'package:ecommerceapp/constant.dart';
import 'package:ecommerceapp/core/viewmodels/home_view_model.dart';
import 'package:ecommerceapp/view/detail_view.dart';
import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
                padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                child: ListView(
                  children: [
                    _searchTextFormField(),
                    SizedBox(
                      height: 30,
                    ),
                    CustomText(
                      text: "Categories",
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    _listViewCategory(),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Best Selling",
                          fontSize: 18,
                        ),
                        CustomText(
                          text: "See all",
                          fontSize: 16,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    _listViewProducts(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryModel[index].image,
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: controller.categoryModel[index].name,
                )
              ],
            );
          },
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width * .4,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(DetailView(
                        productModel: controller.productModel[index],
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade100),
                      child: Container(
                        height: 220,
                        child: Image.network(
                          controller.productModel[index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: controller.productModel[index].name,
                    alignment: Alignment.bottomLeft,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: controller.productModel[index].description,
                    maxLines: 1,
                    color: Colors.grey,
                    alignment: Alignment.bottomLeft,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: "Rp. " + controller.productModel[index].price,
                    alignment: Alignment.bottomLeft,
                    color: primaryColor,
                  )
                ],
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}
