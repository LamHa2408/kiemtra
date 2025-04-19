import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  String? _gender;
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();
  File? _avatar;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? picked = await picker.pickImage(source: ImageSource.gallery); // hoặc .camera
    if (picked != null) {
      setState(() {
        _avatar = File(picked.path);
      });
    }
  }

  Widget _buildAvatar() {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey[300],
        backgroundImage: _avatar != null ? FileImage(_avatar!) : null,
        child: _avatar == null
            ? const Icon(Icons.camera_alt, size: 40, color: Colors.grey)
            : null,
      ),
    );
  }

  Widget _buildGenderButton(String label) {
    return ChoiceChip(
      label: Text(label),
      selected: _gender == label,
      onSelected: (_) => setState(() => _gender = label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thông tin cá nhân'), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Center(child: _buildAvatar()),
            const SizedBox(height: 12),
            const Center(
              child: Text(
                "Thông tin cá nhân",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Họ và Tên',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Giới Tính", style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 10,
              children: [
                _buildGenderButton("Nam"),
                _buildGenderButton("Nữ"),
                _buildGenderButton("Khác"),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dateController,
              readOnly: true,
              onTap: _pickDate,
              decoration: const InputDecoration(
                labelText: 'Ngày Sinh',
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Nhập email của bạn',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Số Điện Thoại',
                hintText: 'Nhập số điện thoại của bạn',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mật Khẩu',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility_off),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
