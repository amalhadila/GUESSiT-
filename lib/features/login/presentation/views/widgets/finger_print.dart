import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guessit_task/core/theme/color_app.dart';
import 'package:guessit_task/core/theme/styles.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/reset_pass.dart';
import 'package:local_auth/local_auth.dart';

class FingerPrint extends StatefulWidget {
  const FingerPrint({super.key});

  @override
  State<FingerPrint> createState() => _FingerPrintState();
}

class _FingerPrintState extends State<FingerPrint> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticating = false;

  Future<void> _authenticate() async {
    bool canCheckBiometrics = await auth.canCheckBiometrics;
    bool isDeviceSupported = await auth.isDeviceSupported();

    if (!canCheckBiometrics || !isDeviceSupported) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("بصمة الإصبع غير مدعومة على هذا الجهاز")),
      );
      return;
    }

    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
      });

      authenticated = await auth.authenticate(
        localizedReason: 'يرجى مسح بصمة الإصبع لتأكيد الهوية',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      print("Error: $e");
    }

    if (authenticated) {
      _showSuccessDialog(); 
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("فشل التحقق بالبصمة ❌")),
      );
    }

    setState(() {
      _isAuthenticating = false;
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          contentPadding: EdgeInsets.all(20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/illustration.png'),
              SizedBox(height: 15),
              Text(
                "Congratulation",
                style: Styles.textStyle24.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Your account is ready. You will be redirected to the home page.",
                textAlign: TextAlign.center,
                style: Styles.textStyle16.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context); 
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ResetPass()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text(
              'Set your Finger Print',
              style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25),
            Text(
              'Approve with finger print for more security',
              style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.w500,
                color: Color(0xff808080),
              ),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: _authenticate,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    if (_isAuthenticating)
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                  ],
                ),
                child: Icon(
                  Icons.fingerprint,
                  size: 160,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const ResetPass()),
                    // );
                    _showSuccessDialog();
                  }, 
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(143.w, 50.h),
                    backgroundColor: Colors.grey.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                  child: Text("SKIP", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _authenticate,
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(143.w, 50.h),
                    backgroundColor: ColorApp.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                  child: Text("FINISH", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
