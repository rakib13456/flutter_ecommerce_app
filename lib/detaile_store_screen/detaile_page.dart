
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 10,
        title: const Text('Product Details',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.more_vert,size: 30,)
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
            constraints: const BoxConstraints.expand(),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                  child: Image.asset('assets/images/bata.jpg',height: 200,width: 300,)),
              Expanded(
                child: Container(

                  padding: EdgeInsets.only(left: 15,right: 15,),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Product Title'),
                        MaterialButton(
                          onPressed: (){},
                          color: Colors.grey,
                          child: const Text('★★★',style: TextStyle(color: Colors.yellow,fontSize: 25),),
                          shape: StadiumBorder(),
                        ),
                      ],
                    ),
                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Product Details',style: TextStyle(fontSize: 15),),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                              borderRadius: BorderRadius.circular(16)
                            ),
                            padding: const EdgeInsets.only(top: 10,left: 10),
                            height: 40,
                            width: 80,

                            child: Text('BDT 580',style: TextStyle(color: Colors.white),),
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Text('Bata sneakers have '
                          'become an essential element'
                          ' of every mans casual wardrobe.'
                          ' These sublime shoes offer a level of style,'
                          ' & comfort that other casual shoes just cant match at this price. '
                          'The unfussy sophistication of this sneaker is appreciated by everybody!'
                          , style: TextStyle(fontSize: 15)),
                      SizedBox(height: 20,),
                      MaterialButton(
                        color: Colors.amber,
                        height: 60,
                       shape: StadiumBorder(),
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                                onPressed: (){},
                              shape: StadiumBorder(),
                              color: Colors.white,
                              child:Text('Buy Now') ,
                                ),
                            MaterialButton(
                              onPressed: (){},
                              shape: StadiumBorder(),
                              color: Colors.white,
                              child: Row(
                                children: const [
                                  Icon(Icons.shopping_cart),
                                  Text('Add Card')
                                ],
                              ),
                            )
                          ],
                        ),

                      ),SizedBox(height: 5,)
                    ],
                  ),
                )

              )

            ],
          ),
        ),
      ),
    );
  }
}
