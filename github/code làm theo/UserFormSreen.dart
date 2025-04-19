import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../model/User.dart';
import '../service/UserAPIService.dart';

class UserFormScreen extends StatefulWidget {
  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name, _email, _phone, _gender = "Nam", _password;
  DateTime? _dob;
  File? _avatar;

  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _avatar = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _dob) {
      setState(() {
        _dob = picked;
      });
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate() && _dob != null) {
      _formKey.currentState!.save();
      User user = User(
        name: _name!,
        email: _email!,
        phone: _phone!,
        gender: _gender!,
        dateOfBirth: _dob!,
        avatarUrl: 'https://via.placeholder.com/150', // Tạm thời dùng ảnh placeholder
      );

      await UserAPIService.instance.createUser(user);
      Navigator.pop(context); // Quay về danh sách sau khi lưu
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Thêm người dùng")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _avatar != null ? FileImage(_avatar!) : null,
                  child: _avatar == null ? Icon(Icons.camera_alt) : null,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Họ và Tên'),
                onSaved: (value) => _name = value,
                validator: (value) => value!.isEmpty ? 'Bắt buộc nhập' : null,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ['Nam', 'Nữ', 'Khác'].map((gender) {
                  return ChoiceChip(
                    label: Text(gender),
                    selected: _gender == gender,
                    onSelected: (_) {
                      setState(() => _gender = gender);
                    },
                  );
                }).toList(),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => _email = value,
                validator: (value) => value!.contains('@') ? null : 'Email không hợp lệ',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Số Điện Thoại'),
                onSaved: (value) => _phone = value,
                validator: (value) => value!.isEmpty ? 'Bắt buộc nhập' : null,
              ),
              ListTile(
                title: Text(_dob == null
                    ? 'Chọn ngày sinh'
                    : 'Ngày sinh: ${DateFormat('dd/MM/yyyy').format(_dob!)}'),
                trailing: Icon(Icons.calendar_month),
                onTap: _selectDate,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mật khẩu'),
                obscureText: true,
                onSaved: (value) => _password = value,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text("Lưu"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
