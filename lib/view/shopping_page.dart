import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/cart_controller.dart';
import 'package:getx_demo/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: GetX<ShoppingController>(
              builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.products[index].productName}',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                          '${controller.products[index].productDescription}'),
                                      //  Text('${controller.products[index].productImage}'),
                                      Text(
                                        '\$${controller.products[index].price}',
                                        style: TextStyle(fontSize: 24),
                                      ),

                                      // IconButton(
                                      //   onPressed: () {
                                      //     controller.products[index].isFav.toggle();
                                      //   },
                                      //   icon: controller.products[index].isFav.value
                                      //       ? Icon(Icons.check_box_rounded)
                                      //       : Icon(Icons
                                      //           .check_box_outline_blank_outlined),
                                      // )
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      cartController.addToCart(
                                          controller.products[index]);
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue)),
                                    child: Text('Add to Cart'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
            )),
            SizedBox(
              height: 30,
            ),
            GetX<CartController>(
              builder: (controller) {
                return Text(
                  'Total amount:\$ ${controller.totalPrice}',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),

            // GetBuilder<CartController>(
            //   builder: (controller) {
            //     return Text(
            //       'Total amount:\$ ${controller.testAmount}',
            //       style: TextStyle(fontSize: 24),
            //     );
            //   },
            // ),

            // Obx(() {
            //   return Text(
            //     'Total amount:\$ ${cartController.totalPrice}',
            //     style: TextStyle(fontSize: 24),
            //   );
            // }),

            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.amber,
          icon: Icon(
            Icons.add_shopping_cart_rounded,
            color: Colors.black,
          ),
          label: GetX<CartController>(
            builder: (controller) {
              return Text(
                controller.count.toString(),
                style: TextStyle(color: Colors.black, fontSize: 24),
              );
            },
          )),
    );
  }
}
