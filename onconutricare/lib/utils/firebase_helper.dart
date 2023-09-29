import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Método para verificar se o usuário está logado
  Future<User?> isLoggedIn() async {
    final currentUser = _auth.currentUser;
    return currentUser;
  }

  // Método para fazer login com email e senha
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return result;
  }

  // Método para fazer logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Método para recuperar a senha do usuário
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // Método para registrar um novo usuário com email e senha
  Future<UserCredential?> registerWithEmailAndPassword(
      String email, String password) async {
    final result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return result;
  }

  // Método para atualizar a senha do usuário
  Future<void> updatePassword(String password) async {
    final currentUser = _auth.currentUser;
    await currentUser!.updatePassword(password);
  }

  // Método para atualizar o email do usuário
  Future<void> updateEmail(String email) async {
    final currentUser = _auth.currentUser;
    await currentUser!.updateEmail(email);
  }

  // Método para atualizar o nome do usuário
  Future<void> updateName(String name) async {
    final currentUser = _auth.currentUser;
    await currentUser!.updateDisplayName(name);
  }
}
