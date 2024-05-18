import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario de registro"),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlutterLogo(
            size: 100,
          ),
          _RegisterForm(),
          SizedBox(
            height: 20,
          ),
        ],
      )),
    ));
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String usuario = '';
  String password = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Nombre de usuario',
              onChanged: (value) => usuario = value,
              validator: (value) {
                if (value == null || value.isEmpty || value.trim().isEmpty) {
                  return 'Este campo es requerido';
                }

                if (value.length < 6) {
                  return 'El nombre de usuario debe tener mas de 6 caracteres';
                }

                return null;
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Correo electronico',
              onChanged: (value) => email = value,
              validator: (value) {
                final emailRegExp = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                );
                if (value == null || value.isEmpty || value.trim().isEmpty) {
                  return 'Este campo es requerido';
                }

                if (value.length < 12) {
                  return 'El email debe tener mas de 12 caracteres';
                }

                if (!emailRegExp.hasMatch(value)) {
                  return 'Introduzca un correo valido';
                }

                return null;
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: "Contraseña",
              obscureText: true,
              onChanged: (value) => password = value,
              validator: (value) {
                if (value == null || value.isEmpty || value.trim().isEmpty) {
                  return 'Este campo es requerido';
                }

                if (value.length < 8) {
                  return 'La contraseña debe tener por lo menos 8';
                }

                return null;
              },
            ),
            const SizedBox(height: 10),
            FilledButton.tonalIcon(
                onPressed: () {
                  final isValid = _formKey?.currentState?.validate() ?? false;
                  if (isValid) {
                    print('${{usuario, password, email}}');
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text('Crear usuario')),
          ],
        ));
  }
}
