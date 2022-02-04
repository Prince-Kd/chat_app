import 'package:chat_app/pages/home.dart';
import 'package:chat_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => Login(),
        'home': (content) => Home(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(

        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey[800]
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.deepPurpleAccent
            )
          )
        )
      ),
      //home: const Login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? email;
  String? password;
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  void signUp() async{
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email!,
          password: password!,
      );
      print('User created: ${userCredential.user!.uid}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('The account already exists for that email.'),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text('OKAY', style: TextStyle(fontSize: 18),))
            ],
          );
        });
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sign up here', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
              const SizedBox(height: 20,),
              TextFormField(
                onChanged: (value){
                  setState(() {
                    email = value;
                  });
                },
               decoration: const InputDecoration(
                 label: Text('Email'),
                 hintText: 'Email here',
               ),
               validator: (value){
                 if(value!.isEmpty){
                   return 'Email is required';
                 }
                 return null;
               },
              ),
              SizedBox(height: 20,),
              TextFormField(
                onChanged: (value){
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Password'),
                  hintText: '',
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      signUp();
                    }
                  },
                  child: const Text('SIGN UP', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                ),
              )
            ]
          ),
        ),
      )
    );
  }
}
