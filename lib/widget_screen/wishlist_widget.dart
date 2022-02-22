import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class MyWishlist extends StatefulWidget {
  const MyWishlist({Key? key}) : super(key: key);

  @override
  _MyWishlistState createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          padding: const EdgeInsets.only(left: 10),
          
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10.0)
          ),
          height: 135,
          width: double.infinity,
          child: Row(
           children:   [
             CircleAvatar(
               backgroundColor:Colors.black,
               radius:60,
                backgroundImage: ExactAssetImage('assets/images/bata2.jpg',),
               child: Text('Bata'),
             ),
             SizedBox(width: 3,),
             Column(
               children: [
                 Text('Brand: Comfit',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                 SizedBox(height: 10,),
                 Text('Price: Tk 1695',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                 Padding(
                   padding: const EdgeInsets.only(right: 20,top: 25),
                   child: MaterialButton(
                     height: 30,
                     onPressed: (){},
                     shape: StadiumBorder(),
                     color: Colors.pink,
                     elevation: 10,
                     child: Row(
                       children: [
                         Icon(Icons.shopping_cart),
                         Text('Add Card')
                       ],
                     ),

                   ),
                 )
               ],
             )
           ],
          ),
        ),

        Positioned(
          top: 5,
            right: 13,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.black,
              child: Icon(Icons.favorite),
            ),
        ),
        Positioned(
          bottom: 8,
            right: 13,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: Icon(Icons.delete,color: Colors.red,),
            )
        )
      ],
    );

  }
}
