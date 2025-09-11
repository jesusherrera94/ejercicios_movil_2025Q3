import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String _initials(String fullname) {
    final parts = fullname.trim().split(' ');
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return (parts.first[0] + parts.last[0]).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    // --- Aquí pones los datos del usuario ---
    final user = User(
      username: 'Valeria',
      fullname: 'Valeria Cruz',
      email: 'valeria_cruz@unitec.edu',
      principalInterest: 'Tarea1',
      password: '',
      profilePicture:
          '', // si quieres usar asset pon 'assets/img/login_icon.png'
    );
    // ----------------------------------------

    const baseBlue = Color.fromARGB(255, 69, 137, 255);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: baseBlue,
        title: const Text('Perfil'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 56,
                    backgroundColor: baseBlue,
                    child: () {
                      if (user.profilePicture != null &&
                          user.profilePicture!.isNotEmpty) {
                        final src = user.profilePicture!;
                        final img =
                            src.startsWith('assets/')
                                ? Image.asset(src, fit: BoxFit.cover)
                                : Image.network(src, fit: BoxFit.cover);
                        return ClipOval(
                          child: SizedBox(width: 100, height: 100, child: img),
                        );
                      } else {
                        return Text(
                          _initials(user.fullname),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                    }(),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    user.fullname,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '@${user.username}',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 18),
                  const Divider(),
                  // Info rows con los colores pedidos
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.email,
                      color: Color(0xFF6385BF),
                    ), // Email
                    title: const Text('Email'),
                    subtitle: Text(user.email),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.person,
                      color: Color(0xFFAA9467),
                    ), // Nombre completo
                    title: const Text('Nombre completo'),
                    subtitle: Text(user.fullname),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.lightbulb,
                      color: Color(0xFF626D80),
                    ), // Interés principal
                    title: const Text('Interés principal'),
                    subtitle: Text(user.principalInterest),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      // aquí podrías abrir edición si quieres más adelante
                    },
                    icon: const Icon(Icons.edit, color: Colors.black),
                    label: const Text(
                      'Editar perfil',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                        0xFFFAC75C,
                      ), // Color del botón
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
