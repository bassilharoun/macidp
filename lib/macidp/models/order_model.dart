
class OrderModel{
  String? paymentMethod;
  String? paymentMethodTitle;
  bool? setPaid;
  dynamic lineItems ;
  dynamic shipping;
  dynamic billing;

  OrderModel({
    this.paymentMethod,
    this.paymentMethodTitle,
    this.setPaid,
    this.lineItems,
    this.shipping,
    this.billing
});

  Map<String, dynamic> toMap(){
    return{
    'payment_method' : paymentMethod,
    'payment_method_title' : paymentMethodTitle,
    'set_paid' : setPaid,
    'shipping' : shipping,
    'billing' : billing,
    'line_items' : lineItems
  };
  }
}

class Shipping{
  String? firstName;
  String? lastName;
  String? address;
  String? city;
  String? state;
  String? postcode;
  String? country ;

  Shipping({
    this.firstName,
    this.lastName,
    this.address,
    this.city,
    this.state,
    this.postcode,
    this.country,
  });

  Map<String, dynamic> toMap(){
    return {
    'first_name' : firstName,
    'last_name' : lastName,
    'address_1' : address,
    'city' : city,
    'state' : state,
    'postcode' : postcode,
    'country' : country

  };
  }
}

class LineItem{
  int? productId;
  int? quantity;

  LineItem({
    this.productId,
    this.quantity,
  });


  Map<String , dynamic> toMap(){
    return {
      'product_id' : productId,
      'quantity' : quantity ,
    };
  }
}