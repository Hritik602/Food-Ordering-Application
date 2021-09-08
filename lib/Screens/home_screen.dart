import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/Screens/products_detail_page.dart';
import 'package:restaurant_app/Store/myStore.dart';

import 'cart_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {

  bool isAdded=true;
   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var store=Provider.of<MyStore>(context);

   // void increaseOrder(){
   //    // ignore: unnecessary_statements
   //     var order=store.activeProduct!.qty;
   //     order=(order!+1)!;
   //  }

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        actions: [
         IconButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
         },
           icon:  Icon(Icons.shopping_cart),
         ),
          Text(store.cart.length.toString()),
        ],
        title: Text("HomeScreen"),

      ),
      body: ListView.separated(
        separatorBuilder: (context,i)=>Divider(),
        shrinkWrap: true,
       // scrollDirection: Axis.horizontal,
        itemCount: store.product.length,
          itemBuilder: (context,i){
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            selectedTileColor: Colors.green,
            onTap: (){
              store.setActiveProducts=(store.product[i]);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail()));
            },
            title: Text(store.product[i].name.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),

            ),
            subtitle: Text(
                "\$${store.product[i].price.toString()}",
            style: TextStyle(
              fontSize: 19,
            ),
            ),
          );
          }),
    );
  }
}
