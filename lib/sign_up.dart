import 'package:agri_ecommerce/main.dart';
import 'package:agri_ecommerce/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String _name;
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final controller = Get.put(SignUpController());
    return Scaffold(
      backgroundColor: const Color(0xff292D32),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome 👋",
                  style: TextStyle(
                      color: Color(0xffC8CACB),
                      fontFamily: 'Metropolis',
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 170, top: 32),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Signup Youself!",
                  style: TextStyle(
                      color: Color(0xffC8CACB),
                      fontFamily: 'Metropolis',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 16, right: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: controller.name,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: "Name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                      onSaved: (value) => _name = value!,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: controller.email,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: "Email",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your email address";
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value!,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: controller.password,
                      decoration: InputDecoration(
                        icon: Icon(Icons.password),
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                      onSaved: (value) => _password = value!,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          SignUpController.instance.registerUser(
                              controller.email.text.trim(),
                              controller.password.text.trim());
                          SignUpController.instance.phoneAuthentication(
                              controller.phoneNo.text.trim());
                          // Use the entered name here
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 16, right: 16),
              child: IntlPhoneField(
                controller: controller.phoneNo,
                showCountryFlag: true,
                initialCountryCode: 'INDIA',
                decoration: const InputDecoration(
                  counter: Offstage(),
                  hintText: 'Enter mobile number',
                  hintStyle:
                      TextStyle(fontSize: 15.0, color: Color(0xffC8CACB)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
                onCountryChanged: (country) {
                  print('Country changed to: ' + country.name);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
              child: Container(
                height: 50,
                width: 380,
                decoration: BoxDecoration(
                    color: const Color(0xffA9DFD8),
                    borderRadius: BorderRadius.circular(25)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MyHomePage(title: 'Sign In')));
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontFamily: 'Metropolis',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'or Continue with',
              style: TextStyle(
                  color: Color(0xffC8CACB),
                  fontFamily: 'Metropolis',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 54,
                    width: 164,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xff8f9586),
                        ),
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignUpPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffffffff),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.asset(
                                        'assets/google_icon.png',
                                        // color: Color(0xff603183),
                                      ))),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 11.0),
                              child: Text(
                                'Google',
                                style: TextStyle(
                                    color: Color(0xffeb4132),
                                    fontFamily: 'Metropolis',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 54,
                    width: 164,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xff8f9586),
                        ),
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignUpPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffffffff),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.asset(
                                        'assets/apple_icon.png',
                                        // color: Color(0xff603183),
                                      ))),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 11.0),
                              child: Text(
                                'Apple',
                                style: TextStyle(
                                    color: Color(0xff141a39),
                                    fontFamily: 'Metropolis',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                      color: Color(0xffC8CACB),
                      fontFamily: 'Metropolis',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const Padding(padding: EdgeInsets.only(left: 8)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage(title: 'home')),
                    );
                  },
                  child: const Text(
                    'SignIn',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Metropolis',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: Text('Sign in page'),
      ),
    );
  }
}
