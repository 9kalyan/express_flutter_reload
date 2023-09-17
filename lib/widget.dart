import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
class app extends StatefulWidget {
  const app({super.key});
  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  kalyan () async{
             Uri uri=Uri.parse('http://127.0.0.1:4000/');
              final res=await http.get(uri);
              if(res.statusCode==200){
kalya=await json.decode(json.encode(res.body)).toString();
            
                print("rakshii");
              }
              else{
                print("sorry");
              } 

  }
  String kalya="kalyan";
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 300,
      height: 300,
      color: const Color.fromARGB(255, 82, 255, 203),
      child: Center(
        child: Row(
          children: [
    
            ElevatedButton(onPressed: ()async{
              kalyan();
            }, child: Text("Press me")),
            Spacer(flex: 1),
              SizedBox(width: 100,height: 30,
              child:FutureBuilder(future:kalyan(), 
              builder:(context,index){

                return Text("${kalya}");
              })
            
            )
          ],
        ),
      ),

    );
  }
}
