import 'package:flutter/material.dart';
import 'package:restaurant_app/Products/products.dart';

class MyStore extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> _cart = [];

  Product? _activeProducts;

  //  increaseOrder(){
  //   // ignore: unnecessary_statements
  //   //     activeProduct!.qty!+activeProduct!.qty!;
  //   //  activeProduct!.qty!++;
  //   notifyListeners();
  //
  // }
  updateQuantity(){
     activeProduct!.qty!;
     notifyListeners();
  }


  itemPrice(){
   var total=(activeProduct!.price!*activeProduct!.qty!);
    // var item=activeProduct!.qty;
    // var total= price!*item!;
    return total;
  }





  addItemToCart(Product i) {

    _cart.add(i);
    notifyListeners();
  }

  removeItemFromCart(Product r) {
    _cart.remove(r);
    notifyListeners();
  }



  MyStore() {
    _products = [
      Product(id: 1, qty: 1, name: "item  1 ",price:122.0),
      Product(id: 2, qty: 1, name: "item  2", price:400.0),
      Product(id: 3, qty: 1, name: "item 3", price:1000.0),
      Product(id: 4, qty: 1, name: "item 4",price:500.0),
      Product(id: 5, qty: 1, name: "item 5",price:240.0),
      Product(id: 6, qty: 1, name: "item 6",price:199.0),
    ];

    notifyListeners();
  }
  List<Product> get product => _products;
  List<Product> get cart => _cart;

  Product? get activeProduct => _activeProducts;

  // ignore: non_constant_identifier_names
  set setActiveProducts(Product p) {
    _activeProducts = p;
  }

}
