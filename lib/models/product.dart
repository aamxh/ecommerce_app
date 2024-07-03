import 'package:equatable/equatable.dart';

class ProductM extends Equatable {

  const ProductM({
    required this.name,
    required this.discountPercent,
    required this.number,
    required this.rating,
    required this.brand,
    required this.price,
    required this.image,
  });

  final String name;
  final List<String> image;
  final double price;
  final int rating;
  final int number;
  final double discountPercent;
  final String brand;

  @override
  List<Object> get props => [name, price, image, number, discountPercent, rating, brand];

}