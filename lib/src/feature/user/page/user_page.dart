import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Верхний блок с логотипом и аккаунтом
              Row(
                children: [
                  Image.asset("asset/image/kicon.png", height: 64),
                  const SizedBox(width: 180),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Davud',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      Text(
                        '+7 000 000 00',
                        style: TextStyle(
                          color: Color(0xFF6F6F6F),
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Карта
              Image.asset("asset/image/cart.png", width: double.infinity),

              const SizedBox(height: 24),

              // Меню
              _buildMenuItem(Icons.settings, "Настройки"),
              _buildMenuItem(Icons.help_outline, "Поддержка"),
              _buildMenuItem(Icons.language, "Язык"),
              _buildMenuItem(Icons.info_outline, "О приложении"),
              _buildMenuItem(Icons.logout, "Выход"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.chevron_right, color: Colors.black54),
      onTap: () {},
    );
  }
}
