class CartItem {
  CartItem({
    required this.description,
    required this.title,
    required this.price,
    this.count = 1,
  });

  String title;
  String description;
  int price;
  int count;

  // Map<String, dynamic> toJson() => {
  //       'title': title,
  //       'description': description,
  //       'price': price,
  //       'count': count,
  //     };

  // factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
  //     description: json['description'],
  //     title: json['title'],
  //     price: json['price']);
}
