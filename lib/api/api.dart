import 'dart:convert';
import 'dart:convert';
import 'package:elias_weam_food2/view/screens/auth/login.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/create_new_pass.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/forgot_pass.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/reset_with_email.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/reset_with_phone.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/verification_code_for_phone.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/verify_code_for_email.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_email/create_pass.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_email/signup_with_email.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_email/your_name.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_phone/name.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_phone/verify_otp.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/sign_up.dart';
import 'package:elias_weam_food2/view/screens/launch/driver_app/driver_get_started.dart';
import 'package:elias_weam_food2/view/screens/launch/driver_app/driver_splash_screen.dart';
import 'package:elias_weam_food2/view/screens/launch/main_app/on_boarding.dart';
import 'package:elias_weam_food2/view/screens/launch/merchant_app/merchant_get_started.dart';
import 'package:elias_weam_food2/view/screens/launch/merchant_app/merchant_splash_screen.dart';
import 'package:elias_weam_food2/view/screens/launch/main_app/splash_screen.dart';
import 'package:elias_weam_food2/view/screens/main_app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:elias_weam_food2/view/screens/main_app/browse/browse.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/delivery_options/delivery_options.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/my_cart/confirm_order.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/my_cart/my_cart.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/payment_methods/edit_payment_method_details.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/payment_methods/payment_methods.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/payment_methods/selected_payment_method_details.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/recent_orders/recent_orders.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/tips_and_notes/custom_amount.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/tips_and_notes/tips_and_notes.dart';
import 'package:elias_weam_food2/view/screens/main_app/home/browse_by_location.dart';
import 'package:elias_weam_food2/view/screens/main_app/home/home.dart';
import 'package:elias_weam_food2/view/screens/main_app/notifications/notifications.dart';
import 'package:elias_weam_food2/view/screens/main_app/notifications/promotions.dart';
import 'package:elias_weam_food2/view/screens/main_app/order_status/delivery_order_status.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile.dart';
import 'package:elias_weam_food2/view/screens/support/support.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';
class Menuitem {
  int id;
  int categoryId;
  int price;
  String itemName;
  List<ItemOptions> itemOptions;
  int itemImageId;
  int quantity=1;

  Menuitem({
    required this.id,
    required this.categoryId,
    required this.price,
    required this.itemName,
    required this.itemOptions,
    required this.itemImageId,
  });

  factory Menuitem.fromJson(Map<String, dynamic> json) {
    return Menuitem(
      id: json['id'],
      categoryId: json['categorieid'],
      price: json['price'],
      itemName: json['item_name'],
      itemOptions: (json['itemoptions'] as List)
          .map((itemOption) => ItemOptions.fromJson(itemOption))
          .toList(),
      itemImageId: json['itemimageid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categorieid': categoryId,
      'price': price,
      'item_name': itemName,
      'itemoptions': itemOptions.map((itemOption) => itemOption.toJson()).toList(),
      'itemimageid': itemImageId,
    };
  }
}
class Category {
  int id;
  String name;
  int restaurantId;
  List<Menuitem> items;

  Category({required this.id, required this.name, required this.restaurantId, required this.items});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],

      restaurantId: json['resturantsid'],
      items: (json['items'] as List).map((item) => Menuitem.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Name': name,
      'resturantsid': restaurantId,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}



class CategoryApi {
  static const String baseUrl = 'https://your-api-url.com/api';

  Future<List<Category>> getCategories() async {
    final response = await get(Uri.parse('$baseUrl/categories'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((category) => Category.fromJson(category)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<Category> createCategory(Category category) async {
    final response = await post(
      Uri.parse('$baseUrl/categories'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(category.toJson()),
    );

    if (response.statusCode == 201) {
      return Category.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create category');
    }
  }

  Future<Category> updateCategory(Category category) async {
    final response = await put(
      Uri.parse('$baseUrl/categories/${category.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(category.toJson()),
    );

    if (response.statusCode == 200) {
      return Category.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update category');
    }
  }

  Future<void> deleteCategory(int id) async {
    final response = await delete(Uri.parse('$baseUrl/categories/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete category');
    }
  }
}

class Restaurant {
  int id;
  String name;
  String address;
  int reviews;
  int deliveryTimeMinutes;
  List<Category> categories;

  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.reviews,
    required this.deliveryTimeMinutes,
    required this.categories,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      address: json['adress'],
      reviews: json['reviews'],
      deliveryTimeMinutes: json['deliverytimeminutes'],
      categories: (json['categorie'] as List)
          .map((category) => Category.fromJson(category))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'adress': address,
      'reviews': reviews,
      'deliverytimeminutes': deliveryTimeMinutes,
      'categorie': categories.map((category) => category.toJson()).toList(),
    };
  }
}

class RestCat {
  int id;
  String name;

  RestCat({required this.id, required this.name});

  factory RestCat.fromJson(Map<String, dynamic> json) {
    return RestCat(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Option {
  int id;
  String name;
  int itemOptionsId;
  int price;
  bool isSelected;

  Option({required this.id, required this.name, required this.itemOptionsId, required this.price, required this.isSelected});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      name: json['name'],
      itemOptionsId: json['itemoptionsid'],
      price: json['price'],
      isSelected: json['isSelected'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Name': name,
      'itemoptionsid': itemOptionsId,
      'price': price,
      'isSelected': isSelected,
    };
  }
}



class ItemOptions {
  int id;
  int menuItemId;
  String name;
  List<Option> options;

  ItemOptions({required this.id, required this.menuItemId, required this.name, required this.options});

  factory ItemOptions.fromJson(Map<String, dynamic> json) {
    return ItemOptions(
      id: json['id'],
      menuItemId: json['menu_itemid'],
      name: json['name'],
      options: (json['options'] as List).map((option) => Option.fromJson(option)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'menu_itemid': menuItemId,
      'name': name,
      'options': options.map((option) => option.toJson()).toList(),
    };}}
class HomeCat {
  int id;
  String name;

  HomeCat({required this.id, required this.name});

  factory HomeCat.fromJson(Map<String, dynamic> json) {
    return HomeCat(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class FoodOrder {
  int id;
  int clientId;
  int restaurantId;
  int orderStatusId;
  int assignedDriverId;
  int clientAddressId;
  String orderDatetime;
  int deliveryFee;
  int totalAmount;
  int custDriverRating;
  int custRestaurantRating;

  FoodOrder({
    required this.id,
    required this.clientId,
    required this.restaurantId,
    required this.orderStatusId,
    required this.assignedDriverId,
    required this.clientAddressId,
    required this.orderDatetime,
    required this.deliveryFee,
    required this.totalAmount,
    required this.custDriverRating,
    required this.custRestaurantRating,
  });

  factory FoodOrder.fromJson(Map<String, dynamic> json) {
    return FoodOrder(
      id: json['id'],
      clientId: json['client_id'],
      restaurantId: json['restaurant_id'],
      orderStatusId: json['order_status_id'],
      assignedDriverId: json['assigned_driver_id'],
      clientAddressId: json['client_adress_id'],
      orderDatetime: json['order_datatime'],
      deliveryFee: json['delivery_fee'],
      totalAmount: json['total_amunt'],
      custDriverRating: json['cust_driver_rating'],
      custRestaurantRating: json['cust_restaurant_raing'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'client_id': clientId,
      'restaurant_id': restaurantId,
      'order_status_id': orderStatusId,
      'assigned_driver_id': assignedDriverId,
      'client_adress_id': clientAddressId,
      'order_datatime': orderDatetime,
      'delivery_fee': deliveryFee,
      'total_amunt': totalAmount,
      'cust_driver_rating': custDriverRating,
      'cust_restaurant_raing': custRestaurantRating,
    };
  }
}

class Client {
  int id;
  String? email;
  String firstName;
  String? password;
  String lastName;
  String? phoneNumber;

  Client({
    required this.id,
    this.email,
    required this.firstName,
    this.password,
    required this.lastName,
    this.phoneNumber,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['Id'],
      email: json['email'],
      firstName: json['firstName'],
      password: json['password'],
      lastName: json['lastName'],
      phoneNumber: json['phonenumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'email': email,
      'firstName': firstName,
      'password': password,
      'lastName': lastName,
      'phonenumber': phoneNumber,
    };
  }
}