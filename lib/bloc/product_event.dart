part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class GetProductEvent extends ProductEvent {}
