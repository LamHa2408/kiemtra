import 'package:flutter/material.dart';

class MyTextField2 extends StatefulWidget {
  const MyTextField2({super.key});

  @override
  State<MyTextField2> createState() => _MyTextField2State();
}

class _MyTextField2State extends State<MyTextField2> {
  final TextEditingController _controller = TextEditingController();
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App 02'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  _text = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Nhập Công Tư',
                prefixIcon: Icon(Icons.person),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    setState(() {
                      _text = '';
                    });
                  },
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('Bạn đã nhập: $_text'),
          ],
        ),
      ),
    );
  }
}
