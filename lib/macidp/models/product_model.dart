class ProductModel{
  dynamic id;
  dynamic name;
  dynamic description;
  dynamic shortDescription;
  dynamic sku;
  dynamic price;
  dynamic regularPrice;
  dynamic salePrice;
  dynamic stockStatus;
  dynamic images;
  dynamic categories;
  dynamic average_rating;
  dynamic rating_count;
  dynamic stock_status;
  dynamic quantity = 1;

  ProductModel(
      this.id,
      this.name,
      this.description,
      this.shortDescription,
      this.sku,
      this.price,
      this.regularPrice,
      this.salePrice,
      this.stockStatus,
      this.images,
      this.categories,
      this.average_rating,
      this.rating_count,
      this.stock_status,
      );

  ProductModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    shortDescription = json['short_description'];
    sku = json['sku'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    average_rating = json['average_rating'];
    rating_count = json['rating_count'];
    stockStatus = json['stock_status'];
    stock_status = json['stock_status'];
    if(json['categories'] != null){
      categories = <Categories>[];
      json['categories'].forEach((v){
        categories.add(new Categories.fromJson(v));
      });
    }
    if(json['images'] != null){
      images = <Images>[];
      json['images'].forEach((v){
        images.add(new Images.fromJson(v));
      });
    }
  }
}

class Categories{
  dynamic id ;
  dynamic name ;

  Categories({this.id, this.name});

  Categories.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }
}

class Images{
  dynamic src ;
  Images({this.src});
  Images.fromJson(Map<String, dynamic> json){
    src = json['src'];
  }
}