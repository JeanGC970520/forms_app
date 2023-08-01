

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: [

          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('State management simple'),
            trailing: const Icon( Icons.arrow_forward_ios_rounded ),
            onTap: () {} ,
          ),

        ],
      ),
    );
  }
}