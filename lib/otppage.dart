import 'dart:ffi';

<<<<<<< HEAD
import 'package:agri_ecommerce/homepage.dart';
=======
>>>>>>> github/master
import 'package:agri_ecommerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:pinput/pinput.dart';
//import 'onboardpage.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff292D32),
      appBar: AppBar(elevation: 0,
        backgroundColor:  Color(0xff292D32),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "OTP Verification",
                  style: TextStyle(
                      color: Color(0xffC8CACB),
                      fontFamily: 'Metropolis',
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "OTP has been sent to your phone  number",
                  style: TextStyle(
                      color: Color(0xff515869),
                      fontFamily: 'Metropolis',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 45, left: 47, right: 47),
                child: Otpform()),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 76, top: 55,),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Didn't receive the OTP ? ",
                      style: TextStyle(
                          color: Color(0xff515869),
                          fontFamily: 'Metropolis',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),Padding(
                  padding: EdgeInsets.only( top: 55,right: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Resend ",
                      style: TextStyle(
                          color: Color(0xffC8CACB),
                          fontFamily: 'Metropolis',
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
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
<<<<<<< HEAD
                        context, MaterialPageRoute(builder: (_) => const home_page()));
=======
                        context, MaterialPageRoute(builder: (_) => const MyHomePage(title: 'hero')));
>>>>>>> github/master
                  },
                  child: const Text(
                    'Verify',
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontFamily: 'Metropolis',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Otpform extends StatefulWidget {
  const Otpform({Key? key}) : super(key: key);

  @override
  State<Otpform> createState() => _OtpformState();
}

class _OtpformState extends State<Otpform> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 60,
              child: TextFormField( maxLength: 1,onChanged: (value){
                if(value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
                decoration: const InputDecoration(counter: Offstage(),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xff8f95a6)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 60,
              child: TextFormField(maxLength: 1,onChanged: (value){
                if(value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
                decoration: const InputDecoration(counter: Offstage(),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xff8f95a6)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 60,
              child: TextFormField(maxLength: 1,onChanged: (value){
                if(value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
                decoration: const InputDecoration(counter: Offstage(),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xff8f95a6)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 60,
              child: TextFormField(maxLength: 1,onChanged: (value){
                if(value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
                maxLengthEnforcement: MaxLengthEnforcement.enforced,

                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                // onChanged: (value) {},
                style: const TextStyle(
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
                decoration: const InputDecoration(
                  counter: Offstage(),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xff8f95a6)),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
