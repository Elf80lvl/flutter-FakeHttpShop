import '../model/products_model.dart';
import 'package:http/http.dart' as http;

class ProductsPepository {
  final String url = 'https://dummyjson.com/products';
  Future getProducts() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = productFromJson(response.body);
      final products = body.products;
      return products;
    } else {
      throw Exception('error fetching products');
    }
  }
}
