import 'package:flutter/material.dart';

class FormBasicV2 extends StatefulWidget {
  const FormBasicV2({super.key});

  @override
  State<FormBasicV2> createState() => _FormBasicV2State();
}

class _FormBasicV2State extends State<FormBasicV2> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Họ tên: ${_nameController.text}');
      print('Email: ${_emailController.text}');
      print('SĐT: ${_phoneController.text}');
      print('Mật khẩu: ${_passwordController.text}');
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCEEFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Form cơ bản',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Họ tên
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Họ tên',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Nhập họ tên' : null,
                ),
                const SizedBox(height: 20),

                // Email
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                  value == null || !value.contains('@')
                      ? 'Email không hợp lệ'
                      : null,
                ),
                const SizedBox(height: 20),

                // Số điện thoại
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Nhập số điện thoại của bạn',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) => value == null || value.length < 9
                      ? 'Số điện thoại không hợp lệ'
                      : null,
                ),
                const SizedBox(height: 20),

                // Mật khẩu
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Mật khẩu',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) =>
                  value == null || value.length < 6
                      ? 'Mật khẩu ít nhất 6 ký tự'
                      : null,
                ),
                const SizedBox(height: 20),

                // Xác nhận mật khẩu
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: !_isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Xác nhận mật khẩu',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(_isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                          !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) =>
                  value != _passwordController.text
                      ? 'Mật khẩu không khớp'
                      : null,
                ),
                const SizedBox(height: 30),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple.shade100,
                      ),
                      child: const Text('Submit'),
                    ),
                    ElevatedButton(
                      onPressed: _resetForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple.shade100,
                      ),
                      child: const Text('Reset'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
