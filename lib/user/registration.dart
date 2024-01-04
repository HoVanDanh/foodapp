import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/model/firebase_auth.dart';
import 'package:foodapp/user/login.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}
final FirebaseAuthservice _auth= FirebaseAuthservice();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController _usernameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _againpasswordController = TextEditingController();
TextEditingController _emailController = TextEditingController();

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed:() {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisSize: MainAxisSize.min, // Xóa dòng này
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.orange),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: AlignmentDirectional.center,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const Text(
                          "Đăng Ký ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            controller: _usernameController,
                            style: TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.orange,
                                ),
                              ),
                              border: OutlineInputBorder(),
                              hintText: 'Nhập username',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập tên người dùng';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            controller: _emailController,
                            style: TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.orange,
                                ),
                              ),
                              border: OutlineInputBorder(),
                              hintText: 'Nhập email',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập email nguoi dung';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.orange,
                                ),
                              ),
                              border: OutlineInputBorder(),
                              hintText: 'Nhập mật khẩu',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập mật khẩu';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            controller: _againpasswordController,
                            obscureText: true,
                            style: TextStyle(color: Colors.orange),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.orange,
                                ),
                              ),
                              border: OutlineInputBorder(),
                              hintText: 'Nhập lai mật khẩu',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập mật khẩu';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(
                              Colors.amberAccent.withOpacity(0.8),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          
                          onPressed: () {
                            _signup();
                            if (_formKey.currentState?.validate() ?? false) {
                              // Validation successful, perform login
                              print('Login successful!');
                              if (_passwordController.text !=
                                  _againpasswordController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                const  SnackBar(
                                    content: Text(
                                      "Mật khẩu và nhập lại mật khẩu không khớp.",
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }
                              // Navigate to registration screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegistrationScreen(),
                                ),
                              );
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Đăng Ký",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),)
    );
  }
  void _signup( ) async{
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user =await _auth.signupWithEmailandPassword(email, password);
    if(user!= null){
      print(" them thanh cong ");
                          Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                          );
    }
    else{
      print(" tao that bai ");
    }
  }
}
