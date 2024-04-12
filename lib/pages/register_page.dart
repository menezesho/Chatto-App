import 'package:chatto/components/elevated_button_custom.dart';
import 'package:chatto/components/textfield_custom.dart';
import 'package:chatto/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void register() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('As senhas não coincidem!')));
      return;
    }

    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.registerWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                const Icon(
                  Icons.message,
                  size: 100,
                ),
                const SizedBox(height: 40),

                // Boas vindas
                Text(
                  "Você se tornará um usuário chatto!",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 52),

                // Campo de e-mail
                TextFieldCustom(
                  controller: emailController,
                  hintText: 'E-mail',
                ),
                const SizedBox(height: 12),

                // Campo de senha
                TextFieldCustom(
                  controller: passwordController,
                  hintText: 'Senha',
                  obscureText: true,
                ),
                const SizedBox(height: 12),

                // Campo de confirmação de senha
                TextFieldCustom(
                  controller: confirmPasswordController,
                  hintText: 'Confirmação de senha',
                  obscureText: true,
                ),
                const SizedBox(height: 32),

                // Botão de cadastro
                ElevatedButtonCustom(
                  onPressed: () {
                    register();
                  },
                  text: 'Cadastrar',
                ),
                const SizedBox(height: 16),

                // Botão de autenticação
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Já possui uma conta?",
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(width: 4),
                      Text(
                        "Entre agora!",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      )
                    ],
                  ),
                  onTap: () {
                    widget.onTap!();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
