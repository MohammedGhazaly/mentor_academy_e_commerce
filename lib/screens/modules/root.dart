import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy_e_commerce/core/controllers/cart_cubits/get/get_cart_cubit.dart';
import 'package:mentor_academy_e_commerce/core/controllers/favorite_cubit/favorite_cubit.dart';
import 'package:mentor_academy_e_commerce/core/network/cache_keys.dart';
import 'package:mentor_academy_e_commerce/core/network/local/cache_helper.dart';
import 'package:mentor_academy_e_commerce/screens/modules/cart_screen.dart';
import 'package:mentor_academy_e_commerce/screens/modules/favorite.dart';
import 'package:mentor_academy_e_commerce/screens/modules/home.dart';

class RootScreen extends StatefulWidget {
  static String routeName = "root-screen";
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getItemsInFavorite();
    getItemsInCart();
  }

  void getItemsInCart() async {
    await BlocProvider.of<GetCartCubit>(context, listen: false).getProducts(
        nationalId: CacheHelper.getData(key: AppKeys.userNationalId));
  }

  void getItemsInFavorite() async {
    await BlocProvider.of<FavoriteCubit>(context, listen: false).getProducts(
        nationalId: CacheHelper.getData(key: AppKeys.userNationalId));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(),
      CartScreen(),
      FavoriteScreen(),
    ];
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(currentPageIndex == 0
            ? "Home"
            : currentPageIndex == 1
                ? "Cart"
                : "Favorite"),
        centerTitle: true,
      ),
      body: screens[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (newPageIndex) {
          currentPageIndex = newPageIndex;
          setState(() {});
        },
        currentIndex: currentPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: CartProductTapText(),
              child: Icon(
                Icons.shopping_cart_rounded,
              ),
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: Text("0"),
              child: Icon(
                Icons.favorite,
              ),
            ),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}

class CartProductTapText extends StatelessWidget {
  const CartProductTapText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var getCartCubit = BlocProvider.of<GetCartCubit>(context, listen: true);
    return Text(getCartCubit.products.length.toString());
  }
}
