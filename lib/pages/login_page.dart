import 'package:chatto/components/elevated_button_custom.dart';
import 'package:chatto/components/textfield_custom.dart';
import 'package:chatto/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Informe o e-mail e a senha')));
      return;
    }

    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('E-mail e/ou senha incorretos')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                "Boas vindas ao Chatto!",
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
              const SizedBox(height: 32),

              // Botão de autenticação
              ElevatedButtonCustom(
                onPressed: () {
                  signIn();
                },
                text: 'Entrar',
              ),
              const SizedBox(height: 16),

              // Divisor
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Divider(thickness: 0.5, color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              // Botão de autenticação com Google
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => AuthService().signInWithGoogle(),
                    child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/google.png',
                          height: 24,
                        )),
                  )
                ],
              ),
              const SizedBox(height: 32),

              // Botão de cadastro
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Não tem uma conta?",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(width: 4),
                    Text(
                      "Cadastre-se!",
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
    );
  }
}
