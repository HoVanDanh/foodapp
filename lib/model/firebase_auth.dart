import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthservice{
FirebaseAuth _auth = FirebaseAuth.instance;
Future<User?> signupWithEmailandPassword( String email, String password) async{
  try{
  UserCredential credential=await _auth.createUserWithEmailAndPassword(email: email, password: password);
  return credential.user;
  }catch(e){
    print("loi thuc hien ");
  }
  return null;
  }
 Future<User?> signinWithEmailandPassword( String email, String password) async{
  try{
  UserCredential credential=await _auth.signInWithEmailAndPassword(email: email, password: password);
  return credential.user;
  }catch(e){
    print("loi thuc hien ");
  } 
  return null;
  }
}