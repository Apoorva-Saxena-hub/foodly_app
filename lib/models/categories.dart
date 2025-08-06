class CategoryModel {
  String? sId;
  String? title;
  String? value;
  String? imageUrl;

  CategoryModel({
    required this.sId,
    required this.title,
    required this.value,
    required this.imageUrl,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    value = json['value'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['value'] = this.value;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
