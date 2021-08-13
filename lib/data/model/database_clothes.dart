
//TODO:

import 'package:ecomproj/domain/entities/clothes_entity.dart';
                            //Entities
class ClothesModel extends ClothesEntity {

 final  int id;
 final  String name;
 final  String status;
 final  String description;
 final  String type;
 final  String image;
 final  List<String> color;
 final  List<String> size;
 final  DateTime created;

  ClothesModel({  
    required this.id,  
     required this.name,
     required this.status,
     this.description="",
     required this.type,
    required  this.image,
     required this.color,
     required this.size,
     required this.created,
  }) : super(color: color, created: created, description: description, id: id, image: image, name: name, size: size, status: status, type: type);

  factory ClothesModel.fromJson(Map<String, dynamic> json) {
     return ClothesModel(
      color: json['color'].cast<String>(),
      created: json['created'].cast<DateTime>(),
      id:json['id'].cast<int>() ,
      image: json['image'],
      name: json['name'],
      size: json['size'].cast<String>(),
      status: json['status'] ?? '',
      type:  json['type'] ?? '',
      description:json['description'] ?? '' ,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clothes'] = this.name;
    data['type'] = this.type;
    data['color'] = this.color;
    data['size'] = this.size;
    data['id'] = this.id;
    data['subscribe'] = this.description;
    return data;
  }

    factory ClothesModel.fromEntity(ClothesEntity entity) => ClothesModel(
        id: entity.id,
        name: entity.name,
        color: entity.color,
        created: entity.created,
        type: entity.type,
        description: entity.description,
        image: entity.image, 
        size: entity.size,
        status: entity.status
      );

}


// extension ClothesModelX on ClothesModel {
//   ClothesEntity toEntity() => ClothesEntity(
//         id: id,
//         name: name,
//         type: type,
//         image: image, 
//         color: color, 
//         created: created, 
//         description: description, 
//         size: size, 
//         status: status,
//       );
// }
