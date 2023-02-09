import 'package:agri_ecommerce/otppage.dart';
import 'package:agri_ecommerce/splash_screen.dart';
import 'package:flutter/material.dart';

//import 'otp_page.dart';
//import 'package:country_picker/country_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() => runApp(MaterialApp(home: Splash()));

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff292D32),
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
            ),Padding(
              padding: const EdgeInsets.only(top: 12.0,left: 16,right: 16),
              child: IntlPhoneField(showCountryFlag:true,initialCountryCode: 'INDIA' ,
                decoration: const InputDecoration(counter:  Offstage(),
                  hintText: 'Enter mobile number',
                    hintStyle: TextStyle(fontSize: 15.0, color: Color(0xffC8CACB)),
                  border: OutlineInputBorder(
                    borderSide:  BorderSide(),
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
              padding: const EdgeInsets.only(top: 20,left: 16,right: 16),
              child: Container(
                height: 50,
                width: 380,
                decoration: BoxDecoration(
                    color: const Color(0xffA9DFD8),
                    borderRadius: BorderRadius.circular(25)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => const OtpPage()));
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
                  padding: const EdgeInsets.only(top:20),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const OtpPage()));
                      },
                      child: Padding(padding: const EdgeInsets.only(left:15),
                        child: Row(
                          children: [Padding(
                            padding: const EdgeInsets.only(left:15.0),
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(10)),
                                    child:  Image.asset(
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
                    decoration: BoxDecoration(border: Border.all(
                      color: const Color(0xff8f9586),
                    ),
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const OtpPage()));
                      },
                      child: Padding(padding: const EdgeInsets.only(left:15),
                        child: Row(
                          children: [Padding(
                            padding: const EdgeInsets.only(left:15.0),
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(10)),
                                    child:  Image.asset(
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

          ],
        ),
      ),
    );
  }
}
