import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final TextEditingController textEditingController;
  final String label;
  final Color maincolor;
  final Color fillcolor;

  const CustomDatePicker({
    super.key,
    required this.textEditingController,
    this.label = "Select Date",
    this.maincolor = Colors.blue,
    this.fillcolor = Colors.white,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  Future<void> _pickDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        widget.textEditingController.text =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      readOnly: true,
      onTap: () => _pickDate(context),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(color: widget.maincolor),
        filled: true,
        fillColor: widget.fillcolor,
        suffixIcon: Icon(Icons.calendar_today, color: widget.maincolor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: widget.maincolor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: widget.maincolor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: widget.maincolor, width: 2),
        ),
      ),
    );
  }
}
