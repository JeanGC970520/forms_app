import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';

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
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
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

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.userName;
    final password = registerCubit.state.password;

    return Form(
      child: Column(
        children: [

          CustomTextFormField(
            label: 'User name',
            onChanged: registerCubit.userNameChanged,
            errorMessage: username.errorMessage,
          ),
          const SizedBox(height: 10,),

          CustomTextFormField(
            label: 'Email',
            onChanged: (value) {
              registerCubit.emailChanged(value);
            },
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
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
          ),
          const SizedBox(height: 10,),

          const SizedBox(height: 30,),

          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            icon: const Icon( Icons.save ), 
            label: const Text('Save'),
          ),

        ],
      ),
    );
  }
}