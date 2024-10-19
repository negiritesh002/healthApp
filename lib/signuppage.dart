import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => RegisterPage();
}

class RegisterPage extends State<Register> {
  bool _isPasswordVisible = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  Future<void> __signup() async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    String age = ageController.text;
    String address = addressController.text;
    String city = cityController.text;
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp emailRegex = RegExp(emailPattern);
    if (!emailRegex.hasMatch(email)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid email address")));
      return;
    }
    String passwordPattern =
        r'^[?=.A-Z]+[?=.a-z]+[?=.0-9]+[?=.!@#$%^&*()_+]{8,}$';
    RegExp passwordRegex = RegExp(passwordPattern);
    if (!passwordRegex.hasMatch(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character.")),
      );
      return;
    }
    String agePattern = r'^[0-9]{1,3}$';
    RegExp ageRegex = RegExp(agePattern);
    if (!ageRegex.hasMatch(age)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid age")),
      );
      return;
    }
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        age.isEmpty ||
        address.isEmpty ||
        city.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please fill in all fields")));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffededf1),
        appBar: AppBar(
          backgroundColor: const Color(0xffD8EFF5),
          title: const Text('Create An Account'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // color: Colors.amber,
                    height: 180,width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/paris.jpeg'), // Make sure the path is correct
                        fit: BoxFit.cover, // Adjusts how the image should fit within the container
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Full Name
                  Container(
                    width: 300, // Set the width
                    height: 50, // Set the height
                    margin: const EdgeInsets.only(
                        bottom: 16), // Margin between fields
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.person, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Color(0xFF35C5Cf), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  ),

                  // Email Address
                  Container(
                    width: 300, // Set the width
                    height: 50, // Set the height
                    margin: const EdgeInsets.only(
                        bottom: 16), // Margin between fields
                    child: TextField(
                      controller: emailController,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.email, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Color(0xFF35C5Cf), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  ),

                  // Password
                  Container(
                    width: 300, // Set the width
                    height: 50, // Set the height
                    margin: const EdgeInsets.only(
                        bottom: 16), // Margin between fields
                    child: TextField(
                      controller: passwordController,
                      obscureText: !_isPasswordVisible, // For password
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.lock, color: Colors.black),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          color: Colors.black,
                          onPressed: () {
                            // Toggle the visibility
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Color(0xFF35C5Cf), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  ),

                  // Mobile Number
                  Container(
                    width: 300, // Set the width
                    height: 50, // Set the height
                    margin: const EdgeInsets.only(
                        bottom: 16), // Margin between fields
                    child: TextField(
                      controller: ageController,
                      decoration: InputDecoration(
                        labelText: "Age",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.child_care, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Color(0xFF35C5Cf), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  ),

                  // Address
                  Container(
                    width: 300, // Set the width
                    height: 50, // Set the height
                    margin: const EdgeInsets.only(
                        bottom: 16), // Margin between fields
                    child: TextField(
                      controller: addressController,
                      decoration: InputDecoration(
                        labelText: "Address",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.home, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Color(0xFF35C5Cf), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 300, // Set the width
                    height: 50, // Set the height
                    margin: const EdgeInsets.only(
                        bottom: 16), // Margin between fields
                    child: TextField(
                      controller: cityController,
                      decoration: InputDecoration(
                        labelText: "City",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon:
                        Icon(Icons.location_city, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Color(0xFF35C5Cf), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  __signup();
                                  // MaterialPageRoute(builder: (context) => HomePage());
                                });
                                print(nameController.text);
                                print(emailController.text);
                                print(passwordController.text);
                                print(ageController.text);
                                print(addressController.text);
                                print(cityController.text);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF35C5Cf)),
                              child: Text(
                                "SIGNUP",
                                style: TextStyle(color: Color(0xffededf1)),
                              ))))
                ],
              ),
            ),
          ),
        ));
  }
}