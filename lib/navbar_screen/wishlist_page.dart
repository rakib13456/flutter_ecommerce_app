import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget_screen/wishlist_widget.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Wish List'),
        centerTitle: true,
      ),

      body:SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 5),
          constraints: BoxConstraints.expand(),
          child: ListView.separated(
            itemCount: 100,
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index){
                return const MyWishlist();
              }, separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 5,);
          },),
        ),
      ),
    );
  }
}


