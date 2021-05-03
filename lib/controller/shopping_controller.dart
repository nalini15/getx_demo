import 'package:get/get.dart';
import 'package:getx_demo/model/product.dart';

class ShoppingController extends GetxController{
  var products=List<Product>().obs;

  @override
  void onInit(){
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async{
    await Future.delayed(Duration(seconds: 1));
    var productResult=[
      Product(
        id: 1,
        price: 20,
        productDescription: 'some description about product',
        productImage: 'abc',
        productName: 'First product',
      ),
      Product(
        id: 2,
        price: 20,
        productDescription: 'some description about product',
        productImage: 'abc',
        productName: 'second product',
      ),
      Product(
        id: 3,
        price: 10,
        productDescription: 'some description about product',
        productImage: 'abc',
        productName: 'third product',
      ),

    ];
    products.value=productResult;
  }
}