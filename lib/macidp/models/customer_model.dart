class CustomerModel{
  dynamic email;
  dynamic firstName;
  dynamic lastName;
  dynamic password;

  CustomerModel(
      this.email,
      this.firstName,
      this.lastName,
      this.password
      );

  CustomerModel.fromJson(Map<String , dynamic>? json){

  }

  Map<String , dynamic> toMap(){
    return {
      'email' : email,
      'first_name' : firstName ,
      'last_name' : lastName ,
      'password' : password ,
      'username' : email ,
    };
  }
}