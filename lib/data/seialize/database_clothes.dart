


class Json_Clothes  {
  late String clothes;
  late String nameclothes;
  late List<String>? color = [];
  late List<String>? size = [];
  late String id;
  late String subscribe;

  Json_Clothes(
      {required this.clothes ,
      required this.nameclothes,
      this.color,
      this.size,
      required this.id,
      this.subscribe =""});

  Json_Clothes.fromJson(Map<String, dynamic> json) {
    clothes = json['clothes'];
    nameclothes = json['nameclothes'];
    color = json['color'].cast<String>();
    size = json['size'].cast<String>();
    id = json['id'];
    subscribe = json['subscribe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clothes'] = this.clothes;
    data['nameclothes'] = this.nameclothes;
    data['color'] = this.color;
    data['size'] = this.size;
    data['id'] = this.id;
    data['subscribe'] = this.subscribe;
    return data;
  }
}