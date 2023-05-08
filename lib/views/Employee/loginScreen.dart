import 'dart:math';
import 'package:flutter/material.dart';
import 'package:otpless_flutter/otpless_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final FlutterTruecaller truecaller = FlutterTruecaller();
  final _otplessFlutterPlugin = Otpless();

  // ** Function to initiate the login process
  void initiateWhatsappLogin(String intentUrl) async{
    var result = await _otplessFlutterPlugin.loginUsingWhatsapp(intentUrl: intentUrl);
    switch (result['code']) {
      case "581":
        print(result['message']);
        //TODO: handle whatsapp not found
        break;
      default:
    }
  }

  // Future getTruecallerProfile() async {
  //   truecaller.initializeSDK(
  //     sdkOptions: FlutterTruecallerScope.SDK_OPTION_WITH_OTP,
  //     footerType: FlutterTruecallerScope.FOOTER_TYPE_ANOTHER_METHOD,
  //     consentMode: FlutterTruecallerScope.CONSENT_MODE_POPUP,
  //   );
  // }


  @override
  void initState() {
    super.initState();
    initPlatformState();
    // getTruecallerProfile();
  }

  // ** Function that is called when page is loaded
  // ** We can check the auth state in this function
  Future<void> initPlatformState() async {
    _otplessFlutterPlugin.authStream.listen((token) {
      // TODO: Handle user token like storing in SharedPreferences or navigation
      log(token.toString() as num);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.grey,
                  Colors.lightBlueAccent,
                ],
              ),
            ),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Welcome to SUPER logistics!!!",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 120),
                      Text(
                        'Continue as',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10.0),
                              margin: EdgeInsets.symmetric(horizontal: 60,vertical: 20),
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 30.0,
                                          width: 30.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('asset/truecaller.png'),
                                              fit: BoxFit.cover,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        OutlinedButton(
                                          onPressed: () {
                                            // await truecaller.getProfile();
                                            // FlutterTruecaller.manualVerificationRequired.listen((required) {
                                            //   if(required) {
                                            //     Navigator.of(context).pushReplacement(
                                            //     MaterialPageRoute(builder: (_) => VerifyMobileNumber()));
                                            // }else{
                                            //     Navigator.of(context).pushReplacement(
                                            //     MaterialPageRoute(builder: (_) => HomePage())
                                            //     );
                                            // }
                                            },
                                          child: Text(
                                            'Continue with truecaller',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                      ]))

                          ),

                          Container(
                              padding: EdgeInsets.all(10.0),
                              margin: EdgeInsets.symmetric(horizontal: 60,vertical: 20),
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 30.0,
                                          width: 30.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('asset/whatsapp.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        OutlinedButton(
                                          onPressed: (){
                                            initiateWhatsappLogin("https://wesoftek.authlink.me?redirectUri=otpless://wesoftek",);
                                          },
                                          child: Text(
                                            'Continue with Whatsapp',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                      ]))

                          )
                        ],
                      )]))
        ));
  }
}
