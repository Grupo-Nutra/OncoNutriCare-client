import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../utils/firebase_helper.dart';
import '../../models/nutritionist/nutritionist.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Nutritionist nutri = getIt<Nutritionist>();

  _submit() async {
    try {
      // trying to login
      late UserCredential? userCredential;
      userCredential = await FirebaseHelper().signInWithEmailAndPassword(
          emailController.value.text, pwdController.value.text);
      // getting PK on API

      // saving globally
      nutri.setNutritionist(userCredential!);
      // login flow successful, navigating to home page
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage =
          'Ocorreu um erro. Por favor, tente novamente mais tarde.';
      if (e.message != null) {
        errorMessage = e.message!;
      }
      switch (e.code) {
        case 'user-not-found':
          errorMessage = ('Usuário não encontrado.');
          break;
        case 'wrong-password':
          errorMessage = ('Senha incorreta.');
          break;
        case 'invalid-email':
          errorMessage = ('E-mail inválido.');
          break;
        case 'user-disabled':
          errorMessage = ('Usuário desabilitado.');
          break;
        case 'too-many-requests':
          errorMessage = ('Limite de tentativas de login excedido.');
          break;
        case 'network-error':
          errorMessage = ('Erro de rede.');
          break;
        default:
          errorMessage = ('Erro ao fazer login.');
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } on Exception catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Ocorreu um erro. Por favor, tente novamente mais tarde. --- $e',
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1,
              horizontal: MediaQuery.of(context).size.width * 0.3),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 300,
                  height: 100,
                  child: Placeholder(),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'Digite seu e-mail',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O campo e-mail é obrigatório.';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: pwdController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite sua senha',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O campo senha é obrigatório.';
                    }

                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: FilledButton(
                    onPressed: () {
                      final formState = formKey.currentState;
                      if (formState!.validate()) {
                        _submit();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Os campos obrigatórios não foram preenchidos corretamente.'),
                          ),
                        );
                      }
                    },
                    child: const Text('ENTRAR'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signup');
                    },
                    child: const Text('Não possui conta? Cadastre-se!'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
