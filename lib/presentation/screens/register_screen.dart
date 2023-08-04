import 'package:flutter/material.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New user'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
        
              const FlutterLogo( size: 100, ),
        
              TextFormField(),
              TextFormField(),
              TextFormField(),
              TextFormField(),

              const SizedBox(height: 30,),
              
              FilledButton.tonalIcon(
                onPressed: () {},
                icon: const Icon( Icons.save ), 
                label: const Text('Save'),
              ),

              const SizedBox(height: 30,),
              
            ],
          ),
        ),
      ),
    );
  }
}