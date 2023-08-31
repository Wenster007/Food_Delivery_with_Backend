import 'package:food_delivery_with_backend/data/repository/favorite_repo.dart';
import 'package:food_delivery_with_backend/models/product_model.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController{

  final FavoriteRepo favoriteRepo;
  FavoriteController(this.favoriteRepo);

  Map<int, Products> favoriteItems = {};
  List<Products> favoriteItemsInStorage = [];

  //for adding items into the favoriteItemsMap
  void addItemToFavorite(Products product) {
    if (favoriteItems.containsKey(product.id)){
      favoriteItems.remove(product.id);
    } else {
      favoriteItems.putIfAbsent(product.id!, () => product);
    }

    favoriteRepo.addFavoritesToSharedPreferences(getItemsList());
    update();
  }


  //for converting the Map into list of Products
  List<Products> getItemsList() {
    return favoriteItems.entries.map((e) => e.value).toList();
  }

  bool isFavorite(Products product) {
    if (favoriteItems.containsKey(product.id)){
      return true;
    } else {
      return false;
    }
  }


  Future<void> getFirebaseDataToSharedPreferences() async{
    await favoriteRepo.addFirebaseDataToSharedPreferences();
  }


  List<Products> getFavItemsFromSharedPreferences() {
    favoriteItems = {};
    favoriteItemsInStorage = favoriteRepo.getFavItemList();

    for (int i=0; i<favoriteItemsInStorage.length ; i++) {
      favoriteItems.putIfAbsent(favoriteItemsInStorage[i].id!, () => favoriteItemsInStorage[i]);
    }

    print(favoriteItems.length.toString() + " length of fav items");
    return favoriteItemsInStorage;
  }
}