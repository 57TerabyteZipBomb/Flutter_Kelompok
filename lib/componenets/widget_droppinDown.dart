import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final Color maincolor;
  final Color fillcolor;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.maincolor = Colors.blue,
    this.fillcolor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      dropdownColor: fillcolor,
      borderRadius: BorderRadius.circular(12),
      style: TextStyle(
        color: Colors.black87,
        fontSize: 16,
      ),
      icon: Icon(Icons.arrow_drop_down, color: maincolor),
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item)
              ))
          .toList(),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: maincolor),
        filled: true,
        fillColor: fillcolor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: maincolor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: maincolor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: maincolor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }
}