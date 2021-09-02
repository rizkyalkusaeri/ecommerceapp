import 'package:ecommerceapp/constant.dart';
import 'package:ecommerceapp/core/viewmodels/cart_view_model.dart';
import 'package:ecommerceapp/view/widgets/custom_button.dart';
import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: GetBuilder<CartViewModel>(
            init: Get.find(),
            builder: (controller) => Container(
              margin: EdgeInsets.only(top: 10),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 140,
                    child: Container(
                      width: 140,
                      child: Row(
                        children: [
                          Image.network(
                            controller.cartProductModel[index].image,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: controller.cartProductModel[index].name,
                                  fontSize: 24,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  color: primaryColor,
                                  text:
                                      'Rp.${controller.cartProductModel[index].price}',
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 140,
                                  height: 40,
                                  color: Colors.grey.shade200,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                        onTap: () {
                                          controller.increaseQuantity(index);
                                        },
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      CustomText(
                                        alignment: Alignment.center,
                                        text: controller
                                            .cartProductModel[index].quantity
                                            .toString(),
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        child: Container(
                                          padding: EdgeInsets.only(bottom: 20),
                                          child: Icon(
                                            Icons.minimize,
                                            color: Colors.black,
                                          ),
                                        ),
                                        onTap: () {
                                          controller.decreaseQuantity(index);
                                        },
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: controller.cartProductModel.length,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 10,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(
                    text: "TOTAL",
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GetBuilder<CartViewModel>(
                    init: Get.find(),
                    builder: (controller) => CustomText(
                      text: 'Rp.${controller.totalPrice}',
                      color: primaryColor,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 80,
                width: 150,
                child: CustomButton(
                  onPressed: () {},
                  text: "Checkout",
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
