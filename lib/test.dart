//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Testing extends StatefulWidget {
  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  bool isChecked=false;
  var _emailController=TextEditingController();
  var _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 90,
          bottom: 30,
          left: 50.0,
          right: 50.0,
        ),
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('LOGIN',style: TextStyle(
                  fontSize: 30.0,
                ),),
                SizedBox(
                  height: 50,
                ),
                Text('Email',style: TextStyle(
                  fontSize: 20.0,
                ),),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),

                ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text('Password',style: TextStyle(
                  fontSize: 20.0,
                ),),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType:TextInputType.visiblePassword ,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
                SizedBox(
                  height: 3.0,
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.pinkAccent,
                      value: isChecked,
                      onChanged:(value){
                        setState(() {
                          isChecked=value;
                        });
                      } ,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('Remember me?',style: TextStyle(
                      fontSize: 20.0,
                    ),),
                  ],
                ),
                SizedBox(
                  height:25.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    color: Colors.pinkAccent,
                      onPressed: (){
                        print(_emailController.text);
                        print (_passwordController.text);
                      },
                    child: Text(
                      'LOGIN',
                    style:TextStyle(fontSize: 20.0,color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 9.0,
                ),
                Container(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Divider(
                         color: Colors.grey
                    ),
                    Container(
                      padding: const EdgeInsetsDirectional.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.all(Radius.circular(15))

                      ),
                      child: Text(
                          'OR',
                      style: TextStyle(fontSize: 15,color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.google,color: Colors.red,),
                    SizedBox(width: 50,),
                    Icon(FontAwesomeIcons.facebookF,color: Colors.blue,),
                    SizedBox(width: 50,),
                    Icon(FontAwesomeIcons.linkedinIn,color: Colors.blue,),
                  ],
                ),


              ],
            ),
        ),

      )
    );
  }
}
