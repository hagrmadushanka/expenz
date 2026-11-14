import 'package:expenz/constants/colors.dart';
import 'package:expenz/constants/constants.dart';
import 'package:expenz/widgets/custum_button.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  //for the check box
  bool _remeberMe = false;

  // form key for the form validation
  final _formKey = GlobalKey<FormState>();

  // controller  for the text form feilds.
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefultpadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // text title
                Text(
                  "Enter your \npersonal Details",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 30),

                // form
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // form feild for the name
                      TextFormField(
                        controller: _userNameController,
                        validator: (value) {
                          // check weather the user entered a valid user name
                          if (value!.isEmpty) {
                            return "Please Enter User Name";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      SizedBox(height: 30),

                      // form feild for the Email
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          // check weather the user entered a valid email
                          if (value!.isEmpty) {
                            return "Please Enter Email";
                          }
                        },
                        // obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      SizedBox(height: 30),

                      // form feild for the Password
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          // check weather the user entered a valid password
                          if (value!.isEmpty) {
                            return "Please Enter password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // form feild for the Confirm Password
                      TextFormField(
                        controller: _confirmPasswordController,
                        validator: (value) {
                          // check weather the user entered a valid confirm  password
                          if (value!.isEmpty) {
                            return "Please Enter the same password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Remember for the next time
                      Row(
                        children: [
                          const Text(
                            "Remember for the next time",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kGrey,
                            ),
                          ),

                          //checkbox
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: kMainColor,
                              value: _remeberMe,
                              onChanged: (value) {
                                setState(() {
                                  _remeberMe = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // subbmit button
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            //form is valid , process data
                            String userName = _userNameController.text;
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            String confirmPassword =
                                _confirmPasswordController.text;

                            print(
                              "$userName $email $password $confirmPassword",
                            );
                          }
                        },
                        child: CustomButton(
                          buttonName: "Next",
                          buttonColor: kMainColor,
                        ),
                      ),
                    ],
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
