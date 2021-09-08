import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/Store/myStore.dart';

import 'buy_item.dart';
import 'cart_screen.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store= Provider.of<MyStore>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text(store.cart.length.toString()),
        ],
        title: Text("Products detail"),

      ),
      body: Column(
        children: [

          Expanded(
              child: Placeholder()),
          Divider(),
          Text(store.activeProduct!.name.toString()),

          Row(
            children: [
              (store.cart.contains(store.activeProduct!))?TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>CartScreen()));
                },
                child: Text("Go to Cart",
                  style: TextStyle(
                      fontSize: 40
                  ),
                ),
              ):
              Consumer(
                builder: (context,myStore,child)=>TextButton(
                  onPressed: (){
                   store.addItemToCart(store.activeProduct!);
                  },
                  child: Text("Add to Cart",
                  style: TextStyle(
                    fontSize: 40
                  ),
                  ),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>BuyItem(itemPrice: store.activeProduct!.price!.toDouble(),)));
            },
            child: Text("Buy Now",
              style: TextStyle(
                  fontSize: 40
              ),
            ),
          ),


        ],
      ),
    );
  }
}
