import 'package:equatable/equatable.dart';

class MyUser extends Equatable {

  final String id, name, email, phone, image;

  const MyUser({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
    'image': image,
  };

  @override
  List<Object> get props => [name, email, image, phone, id];

}