import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../model/post_model.dart';
import 'package:http/http.dart' as http;
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      emit(ProductLoading());
      final uri = Uri.parse('https://dummyjson.com/products');
      final response = await http.get(uri);

      // Parsing JSON ke dalam objek Welcome
      Welcome welcome = Welcome.fromJson(json.decode(response.body));

      // Mengakses list produk
      List<Product> productList = welcome.products;
      emit(ProductSuccess(products: productList));
    });
  }
}
