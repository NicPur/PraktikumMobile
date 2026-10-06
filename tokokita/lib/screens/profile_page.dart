import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Profil",
        ),

        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: const Center(

        child: Text(
          "Halaman Profil TokoKita",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}