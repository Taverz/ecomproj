import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String subscribe;
  final String image;


  const UserEntity({
    required this.id,
    required this.name,
    required this.subscribe,
    required this.image
  });

  @override
  List<Object> get props => [
        id,
        name,
        subscribe,
        image,
      ];

}