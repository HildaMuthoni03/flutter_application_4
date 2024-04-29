class OrdersModel {
  String orderID;
  String firstName;
  String secondName;
  String amount;
  String productImage;
  String productName;
  String photo;

  OrdersModel({
    required this.orderID,
    required this.firstName,
    required this.secondName,
    required this.amount,
    required this.productImage,
    required this.productName,
    required this.photo,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      orderID: json['orderID'],
      firstName: json['firstname'],
      secondName: json['secondname'],
      amount: json['amount'],
      productImage: json['image'],
      productName: json['pname'],
      photo: json['photo'],
    );
  }
}