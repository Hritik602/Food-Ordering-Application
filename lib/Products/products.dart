

class Product{

  int ?id;
  int ?qty;
  String ?name;
  double ?price;

  Product(  {required this.id,required  this.qty,required this.name,required this.price});
  // void toggleDone() {
  //   qty++;
  //   // notifyListeners();
  // }
  //
  //
  // void decreaseDown() {
  //   // ignore: unnecessary_statements
  //   qty == 0 ? 0 : qty!--;
  //   // notifyListeners();
  // }
}