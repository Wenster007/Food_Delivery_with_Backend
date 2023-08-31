import 'dart:convert';

import 'package:food_delivery_with_backend/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/product_model.dart';

class FavoriteRepo {
  final SharedPreferences sharedPreferences;
  FavoriteRepo(this.sharedPreferences);

  List<String> listOfFavoriteItems = [];

  final database = FirebaseDatabase.instance;
  final currentUser = FirebaseAuth.instance;

  void addFavoritesToSharedPreferences(List<Products> listOfProducts) {
    listOfFavoriteItems = [];

    listOfProducts.forEach((product) {
      listOfFavoriteItems.add(jsonEncode(product));
    });

    sharedPreferences.setStringList(AppConstants.LIST_OF_FAVORITE_ITEMS, listOfFavoriteItems);
    addFavoriteItemsToFirebase(listOfFavoriteItems);
  }

  //takes favoriteItems and save it to firebase database.
  void addFavoriteItemsToFirebase(List<String> favoriteItems) {
    database
        .ref("Users")
        .child(currentUser.currentUser!.uid)
        .child("list_of_favorite_items")
        .set(favoriteItems);
  }

//get favoriteItems from firebase and saving in sharedPreferences
  Future<void> addFirebaseDataToSharedPreferences() async {
    List<String> favoriteItemsFetchedFromFirebase = [];

    DatabaseEvent databaseEvent =
    await database.ref("Users").child(currentUser.currentUser!.uid).once();

    Map<dynamic, dynamic> userMap =
    databaseEvent.snapshot.value as Map<dynamic, dynamic>;

    if (userMap["list_of_favorite_items"] != null){
      final favoriteItemsMapList = userMap["list_of_favorite_items"];

      for (int i=0; i<favoriteItemsMapList.length; i++){
        favoriteItemsFetchedFromFirebase.add(favoriteItemsMapList[i]);
      }

      sharedPreferences.setStringList(AppConstants.LIST_OF_FAVORITE_ITEMS, favoriteItemsFetchedFromFirebase);

    } else {
      sharedPreferences.remove(AppConstants.LIST_OF_FAVORITE_ITEMS);
    }
  }


  //for getting the items from sharedPreferences into the memory
  List<Products> getFavItemList() {
    List<String> favoriteItems = [];

    if (sharedPreferences.containsKey(AppConstants.LIST_OF_FAVORITE_ITEMS)) {
      favoriteItems = sharedPreferences.getStringList(AppConstants.LIST_OF_FAVORITE_ITEMS)!;
    }

    List<Products> favoriteItemsList = [];

    favoriteItems.forEach((element) {
      favoriteItemsList.add(Products.fromJson(jsonDecode(element)));
    });
    print(favoriteItemsList.length);

    return favoriteItemsList;
  }


}