import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:shopify/constants/constants.dart';
import 'package:shopify/provider/firebase_provider.dart';
import 'package:shopify/theme/pallete.dart';
import 'package:provider/provider.dart';
import 'package:shopify/utils/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

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
    return GestureDetector(
      onTap: () {
        // Collapse the keyboard when tapping outside the focused text field
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Constants.loginUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                    ),
                    Positioned(
                        left: (MediaQuery.of(context).size.width / 2) - 60,
                        top: MediaQuery.of(context).size.height / 12,
                        child: Column(
                          children: [
                            Image.asset(Constants.logoUrl),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Craft My Plate",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 110,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Login or Signup",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextField(
                          cursorColor: Pallete.bgColor,
                          keyboardType: TextInputType.number,
                          controller: _phoneController,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 16, top: 15),
                            hintText: 'Enter Phone Number',
                            hintStyle: const TextStyle(
                                color: Color(0xFFAAAAAA),
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                            prefixIcon: InkWell(
                              onTap: () {
                                showCountryPicker(
                                  countryListTheme: const CountryListThemeData(
                                    bottomSheetHeight: 500,
                                  ),
                                  context: context,
                                  onSelect: (value) {
                                    selectedCountry = value;
                                  },
                                );
                              },
                              child: SizedBox(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, top: 16.0),
                                child: Text('+${selectedCountry.phoneCode}'),
                              )),
                            ),
                            prefixStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: CustomButton(
                              text: 'Continue',
                              onPressed: () => sendPhoneNumber())),
                      const SizedBox(
                        height: 250,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "By continuing, you agree to our",
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    "Terms of Service",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Privacy Policy",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = _phoneController.text.trim();
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }
}
