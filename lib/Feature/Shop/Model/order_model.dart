import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Feature/Shop/Model/address_model.dart';
import 'package:flutter_application_1/Feature/Shop/Model/cart_item_model.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/enums.dart';

class OrderModel {
  final String Id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;
  OrderModel({
    required this.Id,
    required this.userId,
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Paypal',
    this.address,
    this.deliveryDate,
    required this.items,
  });

  String get formattedOrderDate => THelperFunctions.getFormattedDote(orderDate);
  String get formattedDeliveryDate => deliveryDate != null
      ? THelperFunctions.getFormattedDote(deliveryDate!)
      : '';
  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipped'
          : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      'Id': Id,
      'UserId': userId,
      'Status': status.toString(),
      'TotalAmount': totalAmount,
      'OrderDate': orderDate,
      'PaymentMethod': paymentMethod,
      'Address': address?.toJson(),
      'DeliveryDate': deliveryDate,
      'Items': items.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderModel.fromSnapShot(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data() as Map<String, dynamic>;
    return OrderModel(
      Id: data['Id'] as String,
      userId: data['UserId'] as String,
      status: OrderStatus.values
          .firstWhere((element) => element.toString() == data['Status']),
      totalAmount: data['TotalAmount'] as double,
      orderDate: (data['OrderDate'] as Timestamp).toDate(),
      paymentMethod: data['PaymentMethod'] as String,
      address: data['Address'] != null
          ? AddressModel.fromMap(data['Address'] as Map<String, dynamic>)
          : null,
      deliveryDate: data['DeliveryDate'] != null
          ? (data['DeliveryDate'] as Timestamp).toDate()
          : null,
      items: (data['Items'] as List<dynamic>)
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  ///
}
