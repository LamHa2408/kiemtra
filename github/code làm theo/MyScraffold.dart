import 'package:flutter/material.dart';

class MyText extends StatelessWidget{
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    // tra ve scaffold - widget cung cap bo cuc material design co ban

    return Scaffold(
      // tiêu đề của ứng dụng
      appBar: AppBar(
        title: Text("App 02"),
        backgroundColor: Colors.blue,
        elevation: 4,
        actions: [
          IconButton(
              onPressed: (){print("b1");},
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: (){print("b1");},
              icon: Icon(Icons.abc)),
          IconButton(
              onPressed: (){print("b1");},
              icon: Icon(Icons.more_vert))
        ],
      ),

      // backgroundColor: Colors.yellow,
      
      body: Center(child: Text("Nội dung chính"),),

      floatingActionButton: FloatingActionButton(
          onPressed: (){print("Pressed");},
          child: const Icon(Icons.add_ic_call),
      ),

      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm kiếm"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá nhân"),
      ]),
    );
    
  }
}