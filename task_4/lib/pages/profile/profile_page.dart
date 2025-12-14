import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/routes.dart';
import '../../widgets/text_field.dart';

class ProfilePage extends StatelessWidget {
  final String? name;
  final String? email;

  const ProfilePage({
    this.name,
    this.email,
  });

  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.login);
  }

  void _saveProfile() {
    // Сохранение профиля
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController = TextEditingController();
    final FocusNode _passwordFocusNode = FocusNode();
    final FocusNode _confirmPasswordFocusNode = FocusNode();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                        ),
                        onPressed: () => _logout(context),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Профиль',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(width: 40),
                  ],
                ),
                SizedBox(height: 40),

                CircleAvatar(
                  radius: 60,
                  backgroundColor: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
                  child: Icon(
                      Icons.person,
                      size: 60,
                      color: isDark ? Colors.grey.shade400 : Colors.grey.shade600
                  ),
                ),
                SizedBox(height: 32),

                CustomTextField(
                  controller: TextEditingController(text: name ?? ''),
                  labelText: 'полное имя',
                  focusNode: FocusNode(),
                ),
                SizedBox(height: 16),

                CustomTextField(
                  controller: TextEditingController(text: email ?? ''),
                  labelText: 'email',
                  focusNode: FocusNode(),
                ),
                SizedBox(height: 16),

                CustomTextField(
                  controller: _passwordController,
                  labelText: 'пароль',
                  focusNode: _passwordFocusNode,
                  nextFocusNode: _confirmPasswordFocusNode,
                  isPassword: true,
                ),
                SizedBox(height: 16),

                CustomTextField(
                  controller: _confirmPasswordController,
                  labelText: 'подтверждение пароля',
                  focusNode: _confirmPasswordFocusNode,
                  isPassword: true,
                ),
                SizedBox(height: 32),

                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _saveProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark ? Color(0xFF032E6D) : Color(0xFF507ED1),
                        foregroundColor: Colors.white,
                        splashFactory: NoSplash.splashFactory,
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Сохранить',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}