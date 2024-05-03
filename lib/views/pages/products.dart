import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/controller/logincontroller.dart';
import 'package:flutter_application_4/controller/productcontroller.dart';
import 'package:flutter_application_4/models/productmodels.dart';
import 'package:flutter_application_4/views/w/widgets/custombutton.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
ProductController productController=Get.put(ProductController());
LoginController loginController=Get.put(LoginController());

class Products extends StatelessWidget{
  const Products({super.key});
  
  @override
  Widget build(BuildContext context) {
    getProducts();
    return Obx (()=>ListView.builder(
      shrinkWrap: true,
      itemBuilder: ((context, index) {
      return SizedBox(
        height:150,
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
             Image.network("https://class-26.com/clothesales/pimages/${productController.productList[index].image}",width: 100,height: 100,),
              
                Expanded(
                  child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(
                      productController.productList[index].pname,
                      style:TextStyle(fontSize:17,fontWeight:FontWeight.w600,color: Color.fromARGB(197, 196, 184, 121))
                      ),
                      Text(
                        productController.productList[index].pdescription,
                        style:TextStyle(fontSize:15,fontWeight:FontWeight.normal),
                        maxLines: 3,
                        )
                      ],
                  ),
                ),
                Text(
                    productController.productList[index].price,
                    style:TextStyle(fontSize:17,fontWeight:FontWeight.w600,color: Color.fromARGB(197, 110, 94, 3))
                    ),
                    SizedBox(width: 5,),
                  
              ]),
                CustomButton(
                    buttonLabel: "Order",
                    action: () {
                      createOrder(productController.productList[index].id,productController.productList[index].price);
                    }, buttonText: '', CustomText: '',
                    
                  ),
          ],
        ),
      );
    }),
    itemCount:productController.productList.length,
    ));
    }
    Future<void> getProducts() async{
      http.Response response;
      response=await http.get(Uri.parse("https://class-26.com/clothesales/getproducts.php"));
      if(response.statusCode==200){
      var serverResponse=json.decode(response.body);
      var productResponse=serverResponse['products'];
      var productList=productResponse.map((product)=>ProductModel.fromJson(product)).tolist();
      productController.updateProductList(productList);
    }else{
      print("Error Occured");
  }
  }
  Future<void>createOrder(productID,price)  async{
  http.Response response;
 var body = {
  'productID': '$productID',
  'amount': '$price',
  'phone': '$loginController.phoneNumber.value',
};
   response= await http.post(Uri.parse("https://class-26.com/clothesales/createorder.php"), body:body);
   if(response.statusCode==200){
    var serverResponse=json.decode(response.body);
    int signedup=serverResponse['success'];
    if(signedup==1){
      print("Order created");
    }
    else{
      print("Could not create order");
    }
   }
}
}