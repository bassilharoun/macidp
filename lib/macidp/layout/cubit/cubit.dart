// import 'dart:ffi';
// import 'dart:io';
// import 'package:bloc/bloc.dart';
// import 'package:brgroup/brgroup_app/constance/config.dart';
// import 'package:brgroup/brgroup_app/layout/cubit/states.dart';
// import 'package:brgroup/brgroup_app/models/categories_model.dart';
// import 'package:brgroup/brgroup_app/models/login_model.dart';
// import 'package:brgroup/brgroup_app/models/order_model.dart';
// import 'package:brgroup/brgroup_app/models/product_model.dart';
// import 'package:brgroup/brgroup_app/modules/categories_screen/categories_screen.dart';
// import 'package:brgroup/brgroup_app/modules/fav_screen/fav_screen.dart';
// import 'package:brgroup/brgroup_app/modules/products/products_screen.dart';
// import 'package:brgroup/brgroup_app/modules/search_screen/search_screen.dart';
// import 'package:brgroup/brgroup_app/modules/settings_screen/settings_screen.dart';
// import 'package:brgroup/brgroup_app/shared/components/components.dart';
// import 'package:brgroup/brgroup_app/shared/components/constants.dart';
// import 'package:brgroup/brgroup_app/shared/network/dio_helper.dart';
// import 'package:brgroup/brgroup_app/shared/network/local/cache_helper.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import '../../shared/network/end_points.dart';
//
// class ShopCubit extends Cubit<ShopStates>{
//   ShopCubit() : super(ShopInitialState());
//
//   static ShopCubit get(context) => BlocProvider.of(context);
//
//   int currentIndex = 0 ;
//
//   List<Widget> bottomScreens = [
//     ProductsScreen(),
//     SearchScreen(),
//     FavScreen(),
//     // SettingsScreen(),
//     CategoriesScreen(),
//   ];
//
//   void changeBottom(int index){
//
//     if(index == 0){
//       emit(ShopChangeBottomNavState());
//     }
//
//     if(index == 1){
//       emit(ShopChangeBottomNavState());
//     }
//     if(index == 2){
//       emit(ShopChangeBottomNavState());
//       getWishItems();
//     }
//     if(index == 3){
//       emit(ShopChangeBottomNavState());
//     }
//     if(index == 4){
//       emit(ShopChangeBottomNavState());
//     }
//     currentIndex = index ;
//   }
//
//
//   List<ProductModel> data = [];
//   int numOfPages = 0 ;
//   Future<List<ProductModel>> getHomeData(int page)async{
//     emit(ShopLoadingHomeDataState());
//     try{
//       String url = Config.url + Config.productsUrl +
//           "?consumer_key=${Config.key}&consumer_secret=${Config.secret}&page=$page";
//       var response = await Dio().get(
//         url,
//         options: Options(
//             headers: {
//               HttpHeaders.contentTypeHeader : "application/json"
//             }
//         )
//
//       );
//       if(response.statusCode == 200){
//         data = (response.data as List).map((e) => ProductModel.fromJson(e)).toList();
//         numOfPages = int.parse(response.headers['x-wp-totalpages']!.first) ;
//         print(response.headers['x-wp-totalpages']!.first);
//         print(response.headers['x-wp-totalpages']!.first);
//         print(response.headers['x-wp-totalpages']!.first);
//         print(response.headers['x-wp-totalpages']!.first);
//         print(response.data);
//         emit(ShopSuccessHomeDataState());
//       }
//     } on DioError catch (e){
//       print(e.response);
//     }
//     // print(data[4].images[0].src);
//     return data ;
//
//
//
//   }
//
//   CategoriesModel? categoriesModel ;
//
//   void getCategoriesData(){
//     DioHelper.getData(
//         url: CATEGORIES,
//         token: token
//     ).then((value) {
//       categoriesModel = CategoriesModel.fromJson(value.data);
//       emit(ShopSuccessCategoriesState());
//     }).catchError((error){
//       print(error.toString());
//       emit(ShopErrorCategoriesState());
//     });
//   }
//
//
//   LoginModel? userModel ;
//
//   void getUserData(){
//     emit(ShopLoadingUserDataState());
//     DioHelper.getData(
//         url: PROFILE,
//         token: token
//     ).then((value) {
//       userModel = LoginModel.fromJson(value.data);
//       // print(userModel!.data!.name);
//       emit(ShopSuccessUserDataState(userModel!));
//     }).catchError((error){
//       print(error.toString());
//       emit(ShopErrorUserDataState());
//     });
//   }
//
//   void updateUserData({
//   required String name ,
//     required String email ,
//     required String phone ,
// }){
//     emit(ShopLoadingUpdateUserDataState());
//     DioHelper.putData(
//         url: UPDATE_PROFILE,
//         token: token,
//       data: {
//           'name' : name,
//         'email' : email ,
//         'phone' : phone
//       }
//     ).then((value) {
//       userModel = LoginModel.fromJson(value.data);
//       // print(userModel!.data!.name);
//       emit(ShopSuccessUpdateUserDataState(userModel!));
//     }).catchError((error){
//       print(error.toString());
//       emit(ShopErrorUpdateUserDataState());
//     });
//   }
//
//   int amount = 1 ;
//   int plusAmount(){
//     amount = amount + 1 ;
//     emit(ShopAddAmountState());
//     return amount ;
//   }
//
//   int minusAmount(){
//     if(amount > 0){
//       amount = amount - 1 ;
//       emit(ShopAddAmountState());
//     }
//     return amount ;
//   }
//
//   List<String>? cart = [];
//   dynamic cartCache = [];
//   Future<void> addToCart(product)async{
//     print(product.id);
//     cart!.add("${product.id}");
//     showToast(text: "تمت الاضافة الى العربة", state: ToastStates.SUCCESS);
//     emit(ShopAddToCart());
//   }
//
//   Future getCart()async{
//     try{
//       cartCache = CacheHelper.getData(key: 'cart');
//       for(int i = 0 ; i < cartCache!.length ; i++){
//         cart!.add(cartCache![i]);
//         print(cart);
//         print("--------------------------");
//       }
//
//     }catch(e){
//       print(e);
//     }
//   }
//
//   List<ProductModel> cartItems = [];
//   Future getCartItems()async{
//     emit(ShopLoadingGetCart());
//     cartItems = [];
//     for(int i = 0 ; i < cart!.length ; i++){
//       try{
//         String url = Config.url + Config.productsUrl + "/${cart![i]}" +
//             "?consumer_key=${Config.key}&consumer_secret=${Config.secret}";
//         var response = await Dio().get(
//             url,
//             options: Options(
//                 headers: {
//                   HttpHeaders.contentTypeHeader : "application/json"
//                 }
//             )
//
//         );
//         if(response.statusCode == 200){
//           cartItems.add(ProductModel.fromJson(response.data));
//         }
//       } on DioError catch (e){
//         print(e.response);
//       }
//     }
//     getCartAmount();
//     emit(ShopSuccessGetCart());
//   }
//
//   double totalPrice = 0 ;
//   getCartAmount(){
//     totalPrice = 0 ;
//     for(int i = 0 ; i < cartItems.length ; i++){
//       totalPrice = totalPrice + double.parse(cartItems[i].price);
//     }
//   }
//
//   Future removeCart(ProductModel product)async{
//     print(product.id);
//     cart!.remove("${product.id}");
//     print(cart);
//     print("remove from cart");
//     showToast(text: "تمت الازالة من العربة", state: ToastStates.SUCCESS);
//     emit(ShopRemoveFromCart());
//   }
//
//  ////////////////
//   List<String>? wish = [];
//   dynamic wishCache = [];
//   Future<void> addToWish(ProductModel product)async{
//     print(product.id);
//     wish!.add("${product.id}");
//     emit(ShopAddToCart());
//   }
//
//   Future getWish()async{
//     try{
//       wishCache = CacheHelper.getData(key: 'wish');
//       for(int i = 0 ; i <= cartCache!.length ; i++){
//         wish!.add(wishCache![i]);
//         print(wish);
//         print("--------------------------");
//       }
//
//     }catch(e){
//       print(e);
//     }
//   }
//
//   List<ProductModel> wishItems = [];
//   getWishItems()async{
//     emit(ShopLoadingGetWish());
//     wishItems = [];
//     for(int i = 0 ; i < wish!.length ; i++){
//       try{
//         String url = Config.url + Config.productsUrl + "/${wish![i]}" +
//             "?consumer_key=${Config.key}&consumer_secret=${Config.secret}";
//         var response = await Dio().get(
//             url,
//             options: Options(
//                 headers: {
//                   HttpHeaders.contentTypeHeader : "application/json"
//                 }
//             )
//
//         );
//         if(response.statusCode == 200){
//           wishItems.add(ProductModel.fromJson(response.data));
//         }
//       } on DioError catch (e){
//         print(e.response);
//       }
//     }
//     emit(ShopSuccessGetWish());
//   }
//
//   Future removeWish(ProductModel product)async{
//     print(product.id);
//     wish!.remove("${product.id}");
//     emit(ShopRemoveFromCart());
//   }
//
//
//   List<ProductModel> searchData = [];
//   Future<List<ProductModel>> getSearchData(String txt)async{
//     emit(ShopLoadingGetSearch());
//     try{
//       String url = Config.url + Config.productsUrl +
//           "?consumer_key=${Config.key}&consumer_secret=${Config.secret}&search=$txt";
//       var response = await Dio().get(
//           url,
//           options: Options(
//               headers: {
//                 HttpHeaders.contentTypeHeader : "application/json"
//               }
//           )
//
//       );
//       if(response.statusCode == 200){
//         searchData = (response.data as List).map((e) => ProductModel.fromJson(e)).toList();
//         emit(ShopSuccessGetSearch());
//       }
//     } on DioError catch (e){
//       print(e.response);
//     }
//     return data ;
//   }
//
//   int currentPage = 1 ;
//   increasePage(){
//     if(currentPage < numOfPages){
//       currentPage = currentPage + 1 ;
//       emit(ShopIncreasePage());
//       getHomeData(currentPage);
//     }
//   }
//
//   decreasePage(){
//     if(currentPage > 1){
//       currentPage = currentPage - 1 ;
//       emit(ShopIncreasePage());
//       getHomeData(currentPage);
//     }
//   }
//
//   List<CategoriesModel> categories = [];
//   Future<List<CategoriesModel>> getCategories()async{
//     emit(ShopLoadingGetCategories());
//     try{
//       String url = Config.url + Config.productsUrl + "/categories" +
//           "?consumer_key=${Config.key}&consumer_secret=${Config.secret}&per_page=100";
//       var response = await Dio().get(
//           url,
//           options: Options(
//               headers: {
//                 HttpHeaders.contentTypeHeader : "application/json"
//               }
//           )
//
//       );
//       if(response.statusCode == 200){
//         categories = (response.data as List).map((e) => CategoriesModel.fromJson(e)).toList();
//         print(categories.first.name);
//         print(categories.length);
//         emit(ShopSuccessGetCategories());
//       }
//     } on DioError catch (e){
//       print(e.response);
//     }
//     // print(data[4].images[0].src);
//     return categories ;
//
//
//
//   }
//
//   List<ProductModel> categoryProducts = [];
//   Future<List<ProductModel>> getCategoryProducts(String categoryId)async{
//     emit(ShopLoadingGetCategoryProducts());
//     try{
//       String url = Config.url + Config.productsUrl +
//           "?consumer_key=${Config.key}&consumer_secret=${Config.secret}&category=$categoryId";
//       var response = await Dio().get(
//           url,
//           options: Options(
//               headers: {
//                 HttpHeaders.contentTypeHeader : "application/json"
//               }
//           )
//
//       );
//       if(response.statusCode == 200){
//         categoryProducts = (response.data as List).map((e) => ProductModel.fromJson(e)).toList();
//         emit(ShopSuccessGetCategoryProducts());
//       }
//     } on DioError catch (e){
//       print(e.response);
//     }
//     return categoryProducts ;
//   }
//
//   changeImgView(){
//     emit(ShopSuccessChangeImgView());
//   }
//
//   changeQuantity(){
//     emit(ShopChangeQuantity());
//   }
//
//    createOrder(String firstName, String lastName, String address, String city, String state, String postcode, String country)async{
//     Shipping shipping = Shipping(
//       firstName: firstName,
//       lastName: lastName,
//       address: address,
//       city: city,
//       state: state,
//       postcode: postcode,
//       country: country
//     );
//     List<Map<String, dynamic>> lineItems = [];
//     cartItems.forEach((element) {
//       LineItem model = LineItem(
//         productId: element.id,
//         quantity: element.quantity,
//       );
//       lineItems.add(
//           model.toMap(
//       ));
//     });
//     OrderModel order = OrderModel(
//       paymentMethod: "cod",
//       paymentMethodTitle: "Cash on delivery",
//       setPaid: true,
//       shipping: shipping.toMap(),
//       billing: shipping.toMap(),
//       lineItems: lineItems,
//     );
//     emit(ShopPostOrderLoadingState());
//     print(lineItems.first);
//     print(order.paymentMethodTitle);
//     print(shipping.lastName);
//     print(order.toMap());
//     try{
//       String url = Config.url + "orders" +
//           "?consumer_key=${Config.key}&consumer_secret=${Config.secret}";
//       var response = await Dio().post(
//           url,
//           options: Options(
//               headers: {
//                 HttpHeaders.contentTypeHeader : "application/json"
//               }
//           ),
//         data: order.toMap(),
//
//       );
//       if(response.statusCode == 200 || response.statusCode == 201){
//         var res = response.data ;
//         print(res);
//         CacheHelper.removeData(key: 'cart').then((value) {
//           cart = [];
//           cartItems = [];
//           totalPrice = 0;
//
//         });
//         showToast(text: "تم الطلب", state: ToastStates.SUCCESS);
//         emit(ShopPostOrderSuccessState());
//       }
//     } on DioError catch (e){
//       showToast(text: e.toString(), state: ToastStates.ERROR);
//       print(e.response);
//     }
//
//   }
//
//
//
// }