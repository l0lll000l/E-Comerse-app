import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/MyOrders/widgets/orders_list.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TAppBar(
            showBackArrow: true,
            title: Text('My Orders',
                style: Theme.of(context).textTheme.headlineSmall)),
        body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TOrderListItems(),
        ));
  }
}
