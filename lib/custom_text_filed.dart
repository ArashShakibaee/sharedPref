import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  final FormFieldValidator validator;
  final bool obscureText;
  final bool isButton;
  final IconData? icon;
  final IconData? iconButton;
  final ValueChanged? onChanged;
  final String hintText;
  final String? value;
  final VoidCallback? onPressedIconButton;

  const CustomTextField(
      {Key? key,
      required this.validator,
      required this.controller,
      required this.isButton,
      this.onChanged,
      required this.hintText,
      this.value,
      this.onPressedIconButton,
      this.icon,
      this.iconButton,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
          suffixIcon: isButton
              ? IconButton(
                  onPressed: onPressedIconButton, icon: Icon(iconButton))
              : Icon(icon),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.blue.shade600),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          // نغییر حالت بوردر زمانی که کاربر روی بوردر کلیک میکند
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.blue.shade600),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          // تغییر حالت بوردر زمانی که کاربر اطلاعات اشتباه وارد میکند
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          errorStyle: const TextStyle(fontSize: 14, color: Colors.red)),
    );
  }
}
