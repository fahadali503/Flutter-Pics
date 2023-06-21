import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'widgets/image_list.dart';


class App extends StatefulWidget{
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter  = 0 ;
  List<ImageModel> images = [];
  void fetchImage() async{
    counter++;
    var result = await get(Uri.parse("https://jsonplaceholder.typicode.com/photos/$counter"));
    var imageModel = ImageModel.fromJson(jsonDecode(result.body));
    setState(() {
    images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Let's see Images")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: const Icon(Icons.add),
      ),
      body: ImageList(images: images,),
    ),
  );
  }
  
  

}