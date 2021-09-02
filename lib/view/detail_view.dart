import 'package:ecommerceapp/constant.dart';
import 'package:ecommerceapp/core/viewmodels/cart_view_model.dart';
import 'package:ecommerceapp/model/cart_product_model.dart';
import 'package:ecommerceapp/model/product_model.dart';
import 'package:ecommerceapp/view/widgets/custom_button.dart';
import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  final ProductModel productModel;

  const DetailView({this.productModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Image.network(
                productModel.image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomText(
                        text: productModel.name,
                        fontSize: 26,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: "Size",
                                ),
                                CustomText(
                                  text: productModel.sized,
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: "Color",
                                ),
                                Container(
                                  width: 30,
                                  height: 20,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: productModel.color,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: 'Details',
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: productModel.description,
                        fontSize: 18,
                        height: 2.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: "PRICE",
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: "Rp. " + productModel.price,
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                    init: CartViewModel(),
                    builder: (controller) => Container(
                      padding: EdgeInsets.all(10),
                      width: 150,
                      height: 80,
                      child: CustomButton(
                        text: "ADD",
                        onPressed: () {
                          controller.addProduct(CartProductModel(
                              productId: productModel.productId,
                              name: productModel.name,
                              image: productModel.image,
                              quantity: 1,
                              price: productModel.price));
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
