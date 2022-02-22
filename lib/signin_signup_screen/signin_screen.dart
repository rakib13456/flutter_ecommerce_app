
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello/signin_signup_screen/signup_screen.dart';
import '../detaile_store_screen/store_page.dart';
import '../widget_screen/button_widget.dart';
import '../widget_screen/textfeild_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  bool isVisibility=false;

  Widget topItem(){
    return Column(
      children: [
        SizedBox(height: 16,),
        Image.asset("assets/images/shopping.png",
          height:120,
          width: 120,
        ),
        Column(
          children: [
            MyTextFeild(
                onChange: (value){
                  setState(() {

                  });
                },
                suFix: emailController.text.isNotEmpty ? GestureDetector(
                    onTap: (){
                      emailController.clear();
                    },
                    child: const Icon(Icons.clear,color: CupertinoColors.black,)):Text(''),
                preFix: const Icon(Icons.email,color: CupertinoColors.black,),
                controller:emailController ,
                obsecureText:isVisibility !=isVisibility ,
                hinText: 'Email'),
            MyTextFeild(
                onChange: (value){
                  setState(() {

                  });
                },
                suFix: GestureDetector(
                    onTap: (){
                      isVisibility!=isVisibility;
                      setState(() {

                      });
                    },
                    child: Icon(isVisibility?Icons.visibility:Icons.visibility_off,color: CupertinoColors.black,)),
                preFix: const Icon(Icons.lock,color:CupertinoColors.black, ),
                controller: passController,
                hinText: 'Password',
                obsecureText:isVisibility ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Column(
                children: [
                  ButtonWidget(
                      text:'Sign In ',
                      color:Colors.blue,
                      onPress: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const StorePage()));

                      }),
                  TextButton(onPressed: (){},child:  const Text('Forgate Password'),),
                  //SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Dont have an account?'),
                      TextButton(
                          onPressed: (){},
                          child:GestureDetector(
                              onTap: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context){return SignUpScreen();}));
                              },
                              child: const Text('Create account',style: TextStyle(fontSize: 15),)))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              topItem()
            ],
          ),
        ),
      ),
    );
  }
  userSignIn()async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passController.text
      );
      var user=userCredential.user;
      if (user !=null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const StorePage()));
      }else{
        Fluttertoast.showToast(msg: "Please enter your email & password.");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "No user found for that email.");

      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Wrong password provided for that user.");

      }
    }
  }
}

