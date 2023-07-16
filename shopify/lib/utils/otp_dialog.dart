import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:shopify/provider/firebase_provider.dart';
import 'package:shopify/screens/Login/register_screen.dart';
import 'package:shopify/screens/home/home_screen.dart';
import 'package:shopify/theme/pallete.dart';
import 'package:shopify/utils/custom_button.dart';
import 'package:shopify/utils/snack_bar.dart';

class OTPScreen extends StatefulWidget {
  final String verification;
  final String phone;
  const OTPScreen({required this.verification, required this.phone, super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String? otpcode;
  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return GestureDetector(
      onTap: () {
        // Collapse the keyboard when tapping outside the focused text field
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          backgroundColor: Pallete.otpColor,
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: isLoading
                    ? CircularProgressIndicator(
                        color: Pallete.bgColor,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: GestureDetector(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: const Icon(Icons.arrow_back)),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3.8,
                              ),
                              const Text(
                                "OTP Verification",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3.8,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Column(
                            children: [
                              const Text("We have sent a verification code to ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey)),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "+91-XXXXXX${widget.phone.substring(9)}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: NetworkImage(
                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Eo_circle_green_checkmark.svg/2048px-Eo_circle_green_checkmark.svg.png"),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 44,
                              ),
                              Pinput(
                                length: 6,
                                showCursor: true,
                                defaultPinTheme: const PinTheme(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    textStyle: TextStyle(fontSize: 20)),
                                onCompleted: (value) {
                                  setState(() {
                                    otpcode = value;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: CustomButton(
                                text: "Submit",
                                onPressed: () {
                                  if (otpcode != null) {
                                    verifyOTP(context, otpcode!);
                                  } else {
                                    showSnackBar(context, "Enter 6 digit OTP");
                                  }
                                }),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                child: Text(
                                  "Didn't recieve any code ?  ",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: SizedBox(
                                  child: Text(
                                    "Resend Again.",
                                    style: TextStyle(
                                        color: Pallete.bgColor, fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
              ),
            ),
          )),
    );
  }

  void verifyOTP(BuildContext context, String otp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
        context: context,
        verificationId: widget.verification,
        userOtp: otp,
        onSuccess: () {
          ap.checkExistingUser().then((value) {
            if (value == true) {
              //existing user
              ap.getDataFromFirestore().then((value) {
                ap.saveUserDataToSP().then((value) => {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false),
                    });
              });
            } else {
              //new user
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserInfromationScreen(),
                  ),
                  (route) => false);
            }
          });
        });
  }
}
