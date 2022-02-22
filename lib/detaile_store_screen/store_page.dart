import 'package:flutter/material.dart';
import '../navbar_screen/card_page.dart';
import '../navbar_screen/home_page.dart';
import '../navbar_screen/profile_page.dart';
import '../navbar_screen/wishlist_page.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  int index = 0;
  List pages=[const MyHomePage(),const MyCard(),const WishList(),const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: index ,
        onTap: (value){
          index=value;
          setState(() {

          });
        },

        items: const [BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Card'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,),label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),

        ],
      ),
    );
  }
}