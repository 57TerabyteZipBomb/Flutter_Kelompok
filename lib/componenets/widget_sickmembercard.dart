import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  final String image;
  final String name;
  final String classInfo;
  final String email;

  const MemberCard({
    Key? key,
    required this.image,
    required this.name,
    required this.classInfo,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image, width: 120, height: 120, fit: BoxFit.cover),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(classInfo),
            Text(email),
          ],
        ),
      ),
    );
  }
}