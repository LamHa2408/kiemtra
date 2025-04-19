import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserDetailScreen extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String email;
  final String phone;
  final DateTime dob;

  const UserDetailScreen({
    Key? key,
    required this.avatarUrl,
    required this.name,
    required this.email,
    required this.phone,
    required this.dob,
  }) : super(key: key);

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin người dùng'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(avatarUrl),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('Họ và tên', name),
                    const Divider(),
                    _buildDetailRow('Email', email),
                    const Divider(),
                    _buildDetailRow('Số điện thoại', phone),
                    const Divider(),
                    _buildDetailRow('Ngày sinh', DateFormat('dd/MM/yyyy').format(dob)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
