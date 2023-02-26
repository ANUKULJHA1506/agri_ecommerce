import 'package:country_picker/country_picker.dart';

import 'otppage.dart';
import 'sign_up.dart';

import 'splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

//import 'otp_page.dart';
//import 'package:country_picker/country_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Firebase.initializeApp().then((value) => Get.put(AuthenticationRepository()));
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Splash()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );
  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
    // final controller = Get.put(SignUpController());
    return Scaffold(
      backgroundColor: const Color(0xff292D32),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 60),
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
              padding: EdgeInsets.only(left: 16, top: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter Your Mobile Number",
                  style: TextStyle(
                      color: Color(0xffC8CACB),
                      fontFamily: 'Metropolis',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "You will receive a 4 digit code to verify next. ",
                  style: TextStyle(
                      color: Color(0xff4B5158),
                      fontFamily: 'Metropolis',
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 32),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mobile Number",
                  style: TextStyle(
                      color: Color(0xffC8CACB),
                      fontFamily: 'Metropolis',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 16, right: 16),
              child: IntlPhoneField(
                cursorColor: Colors.white,
                controller: phoneController,
                onChanged: (value) {
                  setState(() {
                    phoneController.text = value as String;
                  });
                },
                /*showCountryFlag: true,
                initialCountryCode: 'INDIA',*/
                decoration: InputDecoration(
                  counter: const Offstage(),
                  hintText: 'Enter mobile number',
                  hintStyle:
                      const TextStyle(fontSize: 15.0, color: Color(0xffC8CACB)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 500,
                            ),
                            onSelect: (value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            });
                      },
                      child: Text(
                        "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  suffixIcon: phoneController.text.length > 9
                      ? Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffA9DFD8),
                          ),
                          child: const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                      : null,
                ),
                /*onChanged: (phone) {
                  print(phone.completeNumber);
                },*/
                /*onCountryChanged: (country) {
                  print('Country changed to: ${country.name}');
                },*/
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
                        context, MaterialPageRoute(builder: (_) => OtpPage()));
                  },
                  child: const Text(
                    'Send OTP',
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
                            MaterialPageRoute(builder: (_) => OtpPage()));
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
                            MaterialPageRoute(builder: (_) => OtpPage()));
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
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignUpPage()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: Color(0xffC8CACB),
                        fontFamily: 'Metropolis',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Metropolis',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
