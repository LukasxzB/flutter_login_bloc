import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';
import 'package:login_bloc/src/blocs/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Bloc bloc = Provider.of(context);

    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(margin: const EdgeInsets.only(top: 25.0)),
          submitButton(bloc),
          StreamBuilder<String?>(
            stream: bloc.validatedEmail,
            builder: (context, snapshot) {
              return Text('Email ${snapshot.data}');
            },
          )
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder<String?>(
      stream: bloc.validatedEmail,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'seu@email.com',
            labelText: 'Email',
            errorText: snapshot.error as String?,
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder<String?>(
      stream: bloc.validatedPassword,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            hintText: '********',
            labelText: 'Senha',
            errorText: snapshot.error as String?,
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: !snapshot.hasData ? null : () {},
          child: const Text('Entrar'),
        );
      },
    );
  }
}
