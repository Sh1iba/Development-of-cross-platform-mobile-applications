import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  const CustomTextField({
    required this.controller,
    required this.labelText,
    required this.focusNode,
    this.nextFocusNode,
    this.isPassword = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _hidePassword = true;

  IconData _getIcon() {
    if (widget.labelText == 'полное имя') return Icons.person;
    if (widget.labelText == 'email') return Icons.email;
    if (widget.labelText.contains('пароль')) return Icons.lock;
    return Icons.lock;
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Заполните это поле';
    }

    if (widget.labelText == 'полное имя') {
      bool validName = RegExp(r'^[a-zA-Zа-яА-ЯёЁ\s]+$').hasMatch(value);
      if (!validName) return 'Только буквы и пробелы';
    }

    if (widget.labelText == 'email') {
      bool validEmail = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);
      if (!validEmail) return 'Введите правильный email';
    }

    if (widget.labelText.contains('пароль')) {
      if (value.length < 6) return 'Минимум 6 символов';
      bool hasLetter = RegExp(r'[a-zA-Z]').hasMatch(value);
      bool hasNumber = RegExp(r'[0-9]').hasMatch(value);
      bool hasSymbol = RegExp(r'[+_-]').hasMatch(value);
      if (!hasLetter || !hasNumber || !hasSymbol) {
        return 'Должны быть буквы, цифры и символы +_-';
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: widget.isPassword && _hidePassword,
      style: TextStyle(
        color: isDark ? Colors.white : Colors.black,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: isDark ? Colors.grey.shade400 : Colors.grey.shade700,
        ),
        prefixIcon: Icon(
          _getIcon(),
          color: isDark ? Colors.grey.shade400 : Colors.grey.shade700,
        ),
        suffixIcon: widget.isPassword ? IconButton(
          icon: Icon(
            _hidePassword ? Icons.visibility : Icons.visibility_off,
            color: isDark ? Colors.grey.shade400 : Colors.grey.shade700,
          ),
          onPressed: () {
            setState(() {
              _hidePassword = !_hidePassword;
            });
          },
        ) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.grey.shade600 : Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Color(0xFF64B5F6) : Color(0xFF507ED1),
          ),
        ),
        filled: true,
        fillColor: isDark ? Color(0xFF2D2D2D) : Colors.grey.shade50,
      ),
      validator: _validateInput,
      onFieldSubmitted: (_) {
        widget.nextFocusNode?.requestFocus();
      },
    );
  }
}