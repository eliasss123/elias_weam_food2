import 'dart:convert';
import 'package:elias_weam_food2/api/api.dart';
import 'package:http/http.dart' as http;
class RestaurantApi {
  static const String baseUrl = 'https://10.0.2.2:7264/api';

  Future<List<Restaurant>> getRestaurants() async {
    final response = await http.get(Uri.parse('$baseUrl/resturants'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((restaurant) => Restaurant.fromJson(restaurant)).toList();
    } else {
      throw Exception('Failed to load restaurants');
    }
  }

  Future<Restaurant> createRestaurant(Restaurant restaurant) async {
    final response = await http.post(
      Uri.parse('$baseUrl/restaurants'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(restaurant.toJson()),
    );

    if (response.statusCode == 201) {
      return Restaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create restaurant');
    }
  }

  Future<Restaurant> updateRestaurant(Restaurant restaurant) async {
    final response = await http.put(
      Uri.parse('$baseUrl/restaurants/${restaurant.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(restaurant.toJson()),
    );

    if (response.statusCode == 200) {
      return Restaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update restaurant');
    }
  }

  Future<void> deleteRestaurant(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/restaurants/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete restaurant');
    }
  }
}

class ClientApi {
  static const String baseUrl = 'https://https://10.0.2.2:7264//api';

  Future<List<Client>> getClients() async {
    final response = await http.get(Uri.parse('$baseUrl/clients'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((client) => Client.fromJson(client)).toList();
    } else {
      throw Exception('Failed to load clients');
    }
  }

  Future<Client> createClient(Client client) async {
    final response = await http.post(
      Uri.parse('$baseUrl/clients'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(client.toJson()),
    );

    if (response.statusCode == 201) {
      return Client.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create client');
    }
  }

  Future<Client> updateClient(Client client) async {
    final response = await http.put(
      Uri.parse('$baseUrl/clients/${client.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(client.toJson()),
    );

    if (response.statusCode == 200) {
      return Client.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update client');
    }
  }

  Future<void> deleteClient(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/clients/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete client');
    }
  }
}

class CategoryApi {
  static const String baseUrl = 'https://https://10.0.2.2:7264//api';

  Future<List<Category>> getCategories(int restaurantId) async {
    final response = await http.get(Uri.parse('$baseUrl/restaurants/$restaurantId/categories'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((category) => Category.fromJson(category)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<Category> createCategory(Category category) async {
    final response = await http.post(
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
    final response = await http.put(
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
    final response = await http.delete(Uri.parse('$baseUrl/categories/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete category');
    }
  }
}

class MenuItemApi {
  static const String baseUrl = 'https://https://10.0.2.2:7264//api';

  Future<List<Menuitem>> getMenuItems(int categoryId) async {
    final response = await http.get(Uri.parse('$baseUrl/categories/$categoryId/menuitems'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((menuItem) => Menuitem.fromJson(menuItem)).toList();
    } else {
      throw Exception('Failed to load menu items');
    }
  }

  Future<Menuitem> createMenuItem(Menuitem menuItem) async {
    final response = await http.post(
      Uri.parse('$baseUrl/menuitems'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(menuItem.toJson()),
    );

    if (response.statusCode == 201) {
      return Menuitem.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create menu item');
    }
  }

  Future<Menuitem> updateMenuItem(Menuitem menuItem) async {
    final response = await http.put(
      Uri.parse('$baseUrl/menuitems/${menuItem.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(menuItem.toJson()),
    );

    if (response.statusCode == 200) {
      return Menuitem.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update menu item');
    }
  }

  Future<void> deleteMenuItem(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/menuitems/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete menu item');
    }
  }
}

class ItemOptionsApi {
  static const String baseUrl = 'https://https://10.0.2.2:7264//api';

  Future<List<ItemOptions>> getItemOptions(int menuItemId) async {
    final response = await http.get(Uri.parse('$baseUrl/menuitems/$menuItemId/itemoptions'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((itemOptions) => ItemOptions.fromJson(itemOptions)).toList();
    } else {
      throw Exception('Failed to load itemoptions');
    }
  }

  Future<ItemOptions> createItemOptions(ItemOptions itemOptions) async {
    final response = await http.post(
      Uri.parse('$baseUrl/itemoptions'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(itemOptions.toJson()),
    );if (response.statusCode == 201) {
      return ItemOptions.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create item options');
    }
  }Future<ItemOptions> updateItemOptions(ItemOptions itemOptions) async {
    final response = await http.put(
      Uri.parse('$baseUrl/itemoptions/${itemOptions.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(itemOptions.toJson()),
    );if (response.statusCode == 200) {
      return ItemOptions.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update item options');
    }}

  Future<void> deleteItemOptions(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/itemoptions/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete item options');
    }
  }
}
class OptionApi {
  static const String baseUrl = 'https://10.0.2.2:7264/api';

  Future<List<Option>> getOptions(int itemOptionsId) async {
    final response = await http.get(Uri.parse('$baseUrl/itemoptions/$itemOptionsId/options'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((option) => Option.fromJson(option)).toList();
    } else {
      throw Exception('Failed to load options');
    }
  }Future<Option> createOption(Option option) async {
    final response = await http.post(
      Uri.parse('$baseUrl/options'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(option.toJson()),
    );if (response.statusCode == 201) {
      return Option.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create option');
    }
  }Future<Option> updateOption(Option option) async {
    final response = await http.put(
      Uri.parse('$baseUrl/options/${option.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(option.toJson()),
    );
    if (response.statusCode == 200) {
      return Option.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update option');
    }
  }
  Future<void> deleteOption(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/options/$id'));if (response.statusCode != 200) {
      throw Exception('Failed to delete option');
    }
  }
}

class HomeCatApi {
  static const String baseUrl = 'https://10.0.2.2:7264/api';

   Future<List<HomeCat>> getHomeCats() async {
    final response = await http.get(Uri.parse('$baseUrl/homecats'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((homeCat) => HomeCat.fromJson(homeCat)).toList();
    } else {
      throw Exception('Failed to load home categories');
    }
  }

  Future<HomeCat> createHomeCat(HomeCat homeCat) async {
    final response = await http.post(
      Uri.parse('$baseUrl/homecats'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(homeCat.toJson()),
    );
    if (response.statusCode == 201) {
      return HomeCat.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create home category');
    }
  }

  Future<HomeCat> updateHomeCat(HomeCat homeCat) async {
    final response = await http.put(
      Uri.parse('$baseUrl/homecats/${homeCat.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(homeCat.toJson()),
    );
    if (response.statusCode == 200) {
      return HomeCat.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update home category');
    }
  }

  Future<void> deleteHomeCat(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/homecats/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete home category');
    }
  }
}
class RestcatApi{
  static const String baseUrl = 'https://10.0.2.2:7264/api';

  Future<List<HomeCat>> getHomeCats() async {
    final response = await http.get(Uri.parse('$baseUrl/homecats'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((restCat) => HomeCat.fromJson(restCat)).toList();
    } else {
      throw Exception('Failed to load home categories');
    }
  }

  Future<HomeCat> createHomeCat(HomeCat homeCat) async {
    final response = await http.post(
      Uri.parse('$baseUrl/homecats'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(homeCat.toJson()),
    );
    if (response.statusCode == 201) {
      return HomeCat.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create home category');
    }
  }

  Future<HomeCat> updateHomeCat(HomeCat homeCat) async {
    final response = await http.put(
      Uri.parse('$baseUrl/homecats/${homeCat.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(homeCat.toJson()),
    );
    if (response.statusCode == 200) {
      return HomeCat.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update home category');
    }
  }

  Future<void> deleteHomeCat(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/homecats/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete home category');
    }
  }
}
class FoodOrderApi {
  static const String baseUrl = 'https://https://10.0.2.2:7264//api';

  Future<List<FoodOrder>> getFoodOrders() async {
    final response = await http.get(Uri.parse('$baseUrl/foodorders'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((foodOrder) => FoodOrder.fromJson(foodOrder)).toList();
    } else {
      throw Exception('Failed to load food orders');
    }
  }

  Future<FoodOrder> createFoodOrder(FoodOrder foodOrder) async {
    final response = await http.post(
      Uri.parse('$baseUrl/foodorders'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(foodOrder.toJson()),
    );
    if (response.statusCode == 201) {
      return FoodOrder.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create food order');
    }
  }

  Future<FoodOrder> updateFoodOrder(FoodOrder foodOrder) async {
    final response = await http.put(
      Uri.parse('$baseUrl/foodorders/${foodOrder.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(foodOrder.toJson()),
    );
    if (response.statusCode == 200) {
      return FoodOrder.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update food order');
    }
  }

  Future<void> deleteFoodOrder(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/foodorders/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete food order');
    }
  }
}