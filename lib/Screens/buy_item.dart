import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/Store/myStore.dart';

class BuyItem extends StatelessWidget {

   double itemPrice;
  BuyItem({Key? key,required this.itemPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var store=Provider.of<MyStore>(context);
    var storeProduct= store.activeProduct!;

    int increaseOrder(){
      // ignore: unnecessary_statements
      var order=store.activeProduct!.qty;
      order=(order!+1);
      return order;
      print(order);

    }


    return Scaffold(
      appBar: AppBar(
        title: Text("Buy Item"),
        centerTitle: true,
      ),
      body: Consumer<MyStore>(
        builder: (context,myCart,child)=>Column(
          children: [
            Container(
              height: 100,
              child: ListTile(
                title: Text(store.activeProduct!.name.toString(),
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                trailing: Text("\$${itemPrice.toDouble()}",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                subtitle: Text("Quantity:${storeProduct.qty}",
                  style: TextStyle(
                    fontSize: 30,
                  ),),
              ),
            ),
            // Row(
            //   children: [
            //     Consumer<MyStore>(
            //       builder:(context,myCart,child)=>ElevatedButton(
            //           onPressed: (){
            //            // print(storeProduct.qty!);
            //            increaseOrder();
            //            print(increaseOrder());
            //             },
            //
            //           child:Icon(Icons.add)
            //       ),
            //     ),
            //     SizedBox(width: 20,),
            //     Consumer(
            //       builder: (context,myCart,child)=>Text(storeProduct.qty!.toString(),
            //         style: TextStyle(
            //           fontSize: 30,
            //         ),
            //         ),
            //     ),
            //     SizedBox(width: 20,),
            //     ElevatedButton(
            //         onPressed: (){
            //          // store.decreaseDown(storeProduct.qty!);
            //         },
            //         child:Icon(Icons.remove)
            //     ),
            //   ],
            // ),

            Consumer(
              builder: (context,myCart,child)=> ElegantNumberButton(
                buttonSizeHeight: 60.0,
                buttonSizeWidth: 60.0,
                minValue: 1,
                maxValue: 10,
                initialValue: storeProduct.qty!,
                decimalPlaces: 0,
                onChanged: (num value) {
                  itemPrice=(value*storeProduct.price!.toDouble());
                  storeProduct.qty=value.toInt();
                  store.updateQuantity();
                  store.itemPrice();
                },
              ),
            ),

          ],
        ),
      ),
    );

  }



}

