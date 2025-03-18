import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guessit_task/core/theme/color_app.dart';
import 'package:guessit_task/core/theme/styles.dart';
import 'package:guessit_task/features/home/presentation/views/home_view.dart';
import 'package:guessit_task/features/home/presentation/views/widgets/bottom_bart.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/finger_print.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String Otp = "";
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
    );  Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context); 
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomBarViewDart()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
             
            
            Text(
              'OTP Code verifcation',
              style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25),
Text(
              'Enter code sent to +201******71',
               textAlign: TextAlign.center,
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w500,color: Color(0xff808080)),
            ),
                        const SizedBox(height: 45),

 PinCodeTextField(
              length: 4,
              obscureText: true,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 48.h,
                fieldWidth: 65.w,
                inactiveColor: Colors.black,
                activeColor: Colors.blue,
                selectedColor: Colors.blue,
              ),
              onChanged: (value) {
                setState(() => Otp = value);
              },
              appContext: context,
            ),
             const SizedBox(height: 25),
Text(
              'Resend code in 55 s',
               textAlign: TextAlign.center,
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w500,color: Color(0xff808080)),
            ),

            SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: Otp.length == 4 ? () {
                 _showSuccessDialog();
                } : null,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(271.w, 50.h),
                  backgroundColor: ColorApp.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(10),
                ),
                child: Text(
                  'Continue',
                  style: Styles.textStyle16.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
  
}
