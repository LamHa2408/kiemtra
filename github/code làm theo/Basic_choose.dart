import 'package:flutter/material.dart';

class BasicChoose extends StatefulWidget {
  const BasicChoose({super.key});

  @override
  State<BasicChoose> createState() => _BasicSelectState();
}

class _BasicSelectState extends State<BasicChoose> {
  String? _gender;
  bool _agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Co Ban'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Họ và tên',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Giới tính',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ListTile(
              leading: Radio<String>(
                value: 'Nam',
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
              title: const Text('Nam'),
            ),
            ListTile(
              leading: Radio<String>(
                value: 'Nữ',
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
              title: const Text('Nữ'),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Số điện thoại',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Xác nhận mật khẩu',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'HCM', child: Text('TP. HCM')),
                DropdownMenuItem(value: 'HN', child: Text('Hà Nội')),
                DropdownMenuItem(value: 'DN', child: Text('Đà Nẵng')),
              ],
              onChanged: (value) {},
              decoration: const InputDecoration(
                labelText: 'Thành phố',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _agree,
                  onChanged: (value) {
                    setState(() {
                      _agree = value!;
                    });
                  },
                ),
                const Expanded(
                  child: Text("Dong y voi dieu khoan cua cty"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade100,
                  ),
                  onPressed: () {},
                  child: const Text("Submit"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade100,
                  ),
                  onPressed: () {},
                  child: const Text("Reset"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
