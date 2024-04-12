import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Autenticação com email e senha
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Autenicação com Google
  signInWithGoogle() async {
    try {
      // Antes de iniciar o processo de autenticação
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtenção dos detalhes da autenticação
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Criação da credencial do usuário
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Autenticação do usuário
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }

  // Logout
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  // Registro
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}
