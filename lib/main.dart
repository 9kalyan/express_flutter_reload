import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main(){
  runApp(app());
}
class app extends StatefulWidget {
  const app({super.key});

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      scrollBehavior: MaterialScrollBehavior(),
      theme: ThemeData(
        useMaterial3: true,
        cardTheme: CardTheme(
          color: Colors.pink
        )
      ),
      home: APP(),
    );
  }
}
class APP extends StatefulWidget {
  const APP({super.key});

  @override
  State<APP> createState() => _APPState();
}

class _APPState extends State<APP> {
  @override
  Widget build(BuildContext context) {
    Future<List> func() async{
      final uri=Uri.parse('http://192.168.82.204:3000');
      List n=[];
      var res=await http.get(uri);
      if(res.body.isNotEmpty){
      n=json.decode(res.body);}
      return n;
    }
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: Border(),
        backgroundColor: Colors.amber,
        middle: Text("kalyan"),
        leading: Icon(CupertinoIcons.back),
      ),
      child: FutureBuilder(future: func(), builder: (context,snapshot)=>
      snapshot.hasData?
      RefreshIndicator(
        
        onRefresh:(){
        return Future.delayed(Duration(seconds: 5),() async{
                final uri=Uri.parse('http://192.168.82.204:3000');
      List n=[];
      var res=await http.get(uri);
      setState(() {
      n=json.decode(res.body);
      });
        });
      },child:
      ListView.builder(
        controller: ScrollController(),
        itemCount: snapshot.data!.length,
      itemBuilder: (context,index){    
        return 
        Card(

          child: Center(
            child: ListTile(
              autofocus: true,
              tileColor: Colors.deepOrange,
              hoverColor: Colors.amberAccent,
              title: Text(snapshot.data![index]['index']),
            ),
          ),
        );
      })):
        Center(child:
      CircularProgressIndicator(
        
        backgroundColor: Colors.amber,
      ))
      ),
      
    );
  }
}