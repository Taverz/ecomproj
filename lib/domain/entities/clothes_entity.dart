import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


class ClothesEntity extends Equatable {
  final int id;
  final String name;
  final String status;
  final String description;
  final String type;
  final String image;
  final List<String> color;
  final List<String> size;
  final DateTime created;

  const ClothesEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.description,
    required this.type,
    required this.image,
    required this.color,
    required this.size,
    required this.created,
  });

  @override
  List<Object> get props => [
        id,
        name,
        status,
        description,
        type,
        image,
        color,
        size,
        created,
      ];
}