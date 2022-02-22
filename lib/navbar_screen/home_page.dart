import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../detaile_store_screen/detaile_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List items = [];

  List catagory = [
    'top',
    'Table',
    'Bed',
    'Chair',
    'Sofa',
    'Almira',
    'Clock',
    'null'
  ];
  int selectedIndex = 0;


  Widget topItem(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Your Best Products',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 45,
            width: 300,
            child: TextField(

              decoration: InputDecoration(

                  hintText: 'Search here',
                  suffixIcon: Icon(Icons.search),
                  fillColor: Colors.grey,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20.0)
                  )
              ),

            ),
          ),
        ),
        const SizedBox(height: 12,),
        Container(
          height: 70,

          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CircleAvatar(

                      child: Text(catagory[index], style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),),
                      backgroundColor: Colors.black,
                      radius: 25,
                    ),

                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 30,);
              },
              itemCount: catagory.length),
        ),
        SizedBox(height: 15,),
        Expanded(

          child: GridView.builder(
              padding: EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4 / 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 6,
              ),
              itemCount: 100,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailsPage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16)
                    ),
                    height: 50,
                    width: 50,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/bata2.jpg', fit: BoxFit.fill,),
                        const Positioned(

                            child: Icon(
                              Icons.favorite, color: Colors.brown, size: 30,)),
                        Positioned(
                            bottom: 40,

                            child: Text('Product Name')),
                        Positioned(
                            bottom: 10,

                            child: Text('Product Description')),
                        Positioned(
                            bottom: 10,
                            right: 5,
                            child: Icon(Icons.shopping_cart))
                      ],

                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: topItem(context),
        ),
      ),
    );
  }
  getData()async{


    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var data = await firestore.collection('Chair').get();

    for(var doc in  data.docs){
      setState(() {
        Map map={
          'title':doc['title'],
          'description':doc['description'],
          'image':doc['image'],
          'price':doc['price'],

        };
        items.add(map);
      });
      print(items);
    }
  }


}



