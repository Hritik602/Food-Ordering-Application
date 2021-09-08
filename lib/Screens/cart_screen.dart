import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/Store/myStore.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart Screen"),
        ),
        body: ListView.builder(
            itemCount: store.cart.length,
            itemBuilder: (context, i) {


                return ListTile(
                  onLongPress: () {
                    print("hello");
                  },
                  leading: Text(store.cart[i].id.toString()),
                  title: Text(store.cart[i].name.toString()),
                  trailing: IconButton(
                    onPressed: () {
                      store.removeItemFromCart(store.cart[i]);
                    },
                    icon: Icon(Icons.remove),
                  ),
                );

            }
            )
    );
  }
}
