import 'package:flutter/material.dart';

import 'package:forms_app/presentation/widgets/widgets.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
        
              FlutterLogo( size: 100, ),
        
              _RegisterForm(),

              SizedBox(height: 30,),
              
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userName = '';  
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [

          CustomTextFormField(
            label: 'User name',
            onChanged: (value) => userName = value,
            validator: (value) {
              if( value == null || value.isEmpty ) return 'Necessary field';
              if( value.trim().isEmpty ) return 'Necessary field';
              if( value.trim().length < 6 ) return 'Can\'t contain less than 6 words';
              return null;
            },
          ),
          const SizedBox(height: 10,),

          CustomTextFormField(
            label: 'Email',
            onChanged: (value) => email = value,
            validator: (value) {
              if( value == null || value.isEmpty ) return 'Necessary field';
              if( value.trim().isEmpty ) return 'Necessary field';

              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );

              if( !emailRegExp.hasMatch(value) ) return 'Don\'t have email format';

              return null;
            },
          ),
          const SizedBox(height: 10,),

          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            onChanged: (value) => password = value,
            validator: (value) {
              if( value == null || value.isEmpty ) return 'Necessary field';
              if( value.trim().isEmpty ) return 'Necessary field';
              if( value.trim().length < 6 ) return 'Can\'t contain less than 6 words';
              return null;
            },
          ),
          const SizedBox(height: 10,),

          const SizedBox(height: 30,),

          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if( !isValid ) return;  
              print('User name: $userName, Email: $email, Password: $password');
            },
            icon: const Icon( Icons.save ), 
            label: const Text('Save'),
          ),

        ],
      ),
    );
  }
}