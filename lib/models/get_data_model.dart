class GetDataModel {
  int? id;
  String? title;
  String? description;
  String? imgLink;
  String? email;

  GetDataModel(
      {this.id, this.title, this.description, this.imgLink, this.email});

  GetDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    imgLink = json['img_link'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['img_link'] = this.imgLink;
    data['email'] = this.email;
    return data;
  }
}
