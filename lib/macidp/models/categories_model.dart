class CategoriesModel{
  int? id ;
  dynamic name;
  dynamic image;

  CategoriesModel(
      this.id,
      this.name,
      this.image
      );

  CategoriesModel.fromJson(Map<String , dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}