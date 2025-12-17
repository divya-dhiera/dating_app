import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../../utility/common_color.dart';
import '../../../utility/text_style.dart';

class PurchaseScreen extends StatefulWidget {
  final List<ProductDetails> products;

  const PurchaseScreen({super.key, required this.products});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  @override
  void initState() {
    super.initState();
    print("enter purchase screen ----->");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        surfaceTintColor: colorWhite,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Purchase", style: tsBlack22w600),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: colorBlack,
            size: 25,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          print("product length ----->${widget.products.length}");
          final product = widget.products[index];

          return ListTile(
            title: Text(product.title),
            subtitle: Text(product.description),
            trailing: Text(product.price),
            onTap: () {
              final PurchaseParam param = PurchaseParam(
                productDetails: product,
              );
              InAppPurchase.instance.buyNonConsumable(purchaseParam: param);
            },
          );
        },
      ),
    );
  }
}
