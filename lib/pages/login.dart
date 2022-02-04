import 'package:chat_app/custom_icons_icons.dart';
import 'package:chat_app/utils/validators.dart';
import 'package:chat_app/widgets/action.dart';
import 'package:chat_app/widgets/auth_button.dart';
import 'package:chat_app/widgets/dialog.dart';
import 'package:chat_app/widgets/loading_dialog.dart';
import 'package:chat_app/widgets/text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email;
  String? password;
  bool loading = false;
  bool googleLoading = false;
  final _formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;



  void SignIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      if (loading == true) {
        try {
          UserCredential userCred = await auth.signInWithEmailAndPassword(
              email: email!, password: password!);
          Navigator.pushReplacementNamed(context, 'home',
              arguments: {'email': userCred.user!.email});
          setState(() {
            loading = false;
          });
        } on FirebaseAuthException catch (error) {
          showDialog(
              context: context,
              builder: (context) {
                return CustomDialog(
                  title: 'Error',
                  content: error.message!,
                  type: 'error',
                );
              });
          setState(() {
            loading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login to chat with friends',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.w600,
                  )),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                //autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextInputWidget(
                      validation: Validators(field: 'Email').required,
                      handleChange: (String value) {
                        setState(() {
                          email = value;
                        });
                      },
                      label: 'Email',
                      hint: 'example@email.com',
                      prefix: Icons.email,
                      obscure: false,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextInputWidget(
                      validation: Validators(field: 'Password').required,
                      handleChange: (String value) {
                        setState(() {
                          password = value;
                        });
                      },
                      label: 'Password',
                      prefix: Icons.lock,
                      suffix: true,
                      obscure: true,
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'Forgot password?',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthButton(
                      loading: loading,
                      content: Center(
                        child: loading
                            ? const CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.white,
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                      color: Colors.deepPurpleAccent,
                      method: SignIn,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Expanded(
                      flex: 1,
                      child: Divider(
                        thickness: 2,
                      )),
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ))),
                  const Expanded(
                      flex: 1,
                      child: Divider(
                        thickness: 2,
                      ))
                ],
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // AuthButton(
              //     color: Colors.blue,
              //     height: 40,
              //     content: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: const [
              //         Icon(CustomIcons.google, color: Colors.white),
              //         SizedBox(
              //           width: 20,
              //         ),
              //         Text('Sign in with Google',
              //             style: TextStyle(color: Colors.white, fontSize: 18))
              //       ],
              //     ),
              //     method: googleSignIn),
              SizedBox(
                height: 15,
              ),
              AuthButton(
                  color: Colors.white,
                  height: 40,
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(CustomIcons.facebook_squared, color: Colors.blue),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Sign in with Facebook',
                          style: TextStyle(color: Colors.blue, fontSize: 18))
                    ],
                  ),
                  method: () {})
            ],
          ),
        ));
  }
}
