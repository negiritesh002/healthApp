import 'package:flutter/material.dart';
import 'package:healthapp/sliderscreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordvisibility=false;
  FocusNode fieldone = FocusNode();
  FocusNode fieldtwo = FocusNode();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future <void> _signup()async{
    String Email = _emailController.text;
    String Password = _passwordController.text;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  // Validate Email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    const emailPattern =
        r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    final regExp = RegExp(emailPattern);
    if (!regExp.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  // Validate Password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  // Submit form
  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Email: $_email');
      print('Password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                CarouselSlider(),
                SizedBox(height: 40,),
                TextFormField(
                  focusNode: fieldone,
                  onFieldSubmitted: (value){
                    FocusScope.of(context).unfocus();
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                      BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFF35C5Cf), width: 2.0),
                    ),
                    label: Text("E-mail",
                        style: TextStyle(
                            color: Colors.black
                        )
                    ),
                    border: OutlineInputBorder(),

                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                // Password Input
                TextFormField(
                  focusNode: fieldtwo,
                  onFieldSubmitted: (value){
                    FocusScope.of(context).unfocus();
                  },

                  controller: _passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordvisibility
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      color: Colors.black,
                      onPressed: () {
                        // Toggle the visibility
                        setState(() {
                          _passwordvisibility = !_passwordvisibility;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                      BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                      BorderSide(color: Color(0xFF35C5Cf), width: 2.0),
                    ),
                    label: Text("Password",
                        style: TextStyle(
                            color: Colors.black
                        )
                    ),
                    border: OutlineInputBorder(),
                  ),


                  obscureText: !_passwordvisibility,
                  validator: _validatePassword,
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                SizedBox(height: 10,),
                TextButton(onPressed: () {
                }, child: Text("Forgot Password?",style: TextStyle(color: Colors.blue),)),
                const SizedBox(height: 10.0),
                // Login Button
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color(0xFF35C5Cf))),
                      onPressed: _submit,
                      child: const Text('Login',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(children: <Widget>[
                    Expanded(child: Divider()),
                    Text(
                      "OR",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Expanded(child: Divider()),
                  ]),
                ),
                const SizedBox(height: 10,),
                TextButton(onPressed: () {

                }, child: Text("Create New Account",style: TextStyle(color: Colors.blue),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
