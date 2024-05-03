import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/controller/logincontroller.dart';
import 'package:flutter_application_4/controller/orderscontroller.dart';
import 'package:flutter_application_4/models/ordersmodel.dart';
import 'package:flutter_application_4/views/w/widgets/custombutton.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
LoginController loginController=Get.put(LoginController());
OrderController orderController=Get.put(OrderController());

class Orders extends StatelessWidget{
  const Orders({super.key});
  
  @override
  Widget build(BuildContext context) {
    getOrders();
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
             Image.network("https://class-26.com/clothesales/userimages/${orderController.orderList[index].photo}",
             width: 100,height: 100,),
              
                Expanded(
                  child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(
                      orderController.orderList[index].firstName,
                      style:TextStyle(fontSize:17,fontWeight:FontWeight.w600,color: Color.fromARGB(197, 196, 184, 121))
                      ),
                      Text(
                        orderController.orderList[index].productName,
                        style:TextStyle(fontSize:15,fontWeight:FontWeight.normal),
                        maxLines: 3,
                        ),
                      Text(
                        "ORDER ID:"+orderController.orderList[index].orderID,
                        style:TextStyle(fontSize:15,fontWeight:FontWeight.normal),
                        ),
                      ],
                  ),
                ),
                Text(
                    orderController.orderList[index].amount,
                    style:TextStyle(fontSize:17,fontWeight:FontWeight.w600,color: Color.fromARGB(197, 110, 94, 3))
                    ),
                    SizedBox(width: 5,),
                  
              ]),
                 CustomButton(
                buttonLabel: "Cancel Order",
                action: () {
                }, buttonText: '', CustomText: '',
                
              ),
          ],
        ),
      );
    }),
    itemCount:orderController.orderList.length,
    ));
    }
    Future<void> getOrders() async{
      http.Response response;
      response=await http.get(Uri.parse("https://class-26.com/clothesales/getorders.php"));
      if(response.statusCode==200){
      var serverResponse=json.decode(response.body);
      var productResponse=serverResponse['orders'];
      var orderList=productResponse.map((order)=>OrdersModel.fromJson(order)).tolist();
      orderController.updateOrderList(orderList);
    }else{
      print("Error Occured");
  }
  }
  Future<void>cancelOrder(orderID)  async{
  http.Response response;
   response= await http.post(Uri.parse(
    "https://class-26.com/clothesales/cancelorder.php?orderID=$orderID"));
   if(response.statusCode==200){
    getOrders();
    }
    else{
      print("Error occured");
    }
   }
}