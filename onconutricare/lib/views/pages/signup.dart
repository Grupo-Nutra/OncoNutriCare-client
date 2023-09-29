import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onconutricare/views/widgets/crn_dropdown.dart';

import '../../main.dart';
import '../../models/nutritionist/nutritionist.dart';
import '../../utils/firebase_helper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController pwdConfirmController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController crnNController = TextEditingController();
  final TextEditingController crnAController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Nutritionist nutri = getIt<Nutritionist>();

  final List<String> items = [
    'CRN-1',
    'CRN-2',
    'CRN-3',
    'CRN-4',
    'CRN-5',
    'CRN-6',
    'CRN-7',
    'CRN-8',
    'CRN-9',
    'CRN-10',
    'CRN-11',
  ];

  String? selectedValue;

  _submit() async {
    try {
      // trying to register
      late UserCredential? userCredential;
      userCredential = await FirebaseHelper().registerWithEmailAndPassword(
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
        case 'email-already-in-use':
          errorMessage = ('E-mail já está em uso.');
          break;
        case 'invalid-email':
          errorMessage = ('E-mail inválido.');
          break;
        case 'weak-password':
          errorMessage = ('Senha muito fraca.');
          break;
        case 'network-error':
          errorMessage = ('Erro de rede.');
          break;
        default:
          errorMessage = (e.message!);
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
      appBar: AppBar(),
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
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Digite seu nome',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O nome é obrigatório.';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'Digite seu e-mail',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O e-mail é obrigatório.';
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
                      return 'A senha é obrigatória.';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: pwdConfirmController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirmação de senha',
                    hintText: 'Digite novamente sua senha',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'A confirmação de senha é obrigatória.';
                    }

                    if (pwdController.text != value) {
                      return 'As senhas não coincidem.';
                    }

                    return null;
                  },
                ),
                /* 
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: DropdownMenu<String>(
                        initialSelection: items.first,
                        dropdownMenuEntries: items
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                        onSelected: (String? newValue) {
                          setState(() {
                            selectedValue = newValue;
                          });
                          // state.didChange(newValue);
                        },
                        label: Text('CRN'),
                        hintText: 'Selecione um CRN',
                      ),
                    ),
                    TextFormField(
                      controller: crnNController,
                      decoration: const InputDecoration(
                        labelText: 'Inscrição',
                        hintText: 'Digite o número de sua inscrição',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O número da inscrição é obrigatório.';
                        }

                        return null;
                      },
                    ),
                  ],
                ),
                 */
                TextFormField(
                  controller: phoneController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Telefone',
                    hintText: 'Digite seu número de telefone',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O número de telefone é obrigatório.';
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
                    child: const Text('CADASTRAR'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text('Já possui uma conta? Clique aqui!'),
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
