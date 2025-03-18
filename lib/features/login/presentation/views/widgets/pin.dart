import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guessit_task/core/theme/color_app.dart';
import 'package:guessit_task/core/theme/styles.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/finger_print.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Pin extends StatefulWidget {
  const Pin({super.key});

  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
  String pin = "";

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
              'Create New PIN',
              style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25),
Text(
              'Add PIN Number to secure your account',
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
                setState(() => pin = value);
              },
              appContext: context,
            ),

            SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: pin.length == 4 ? () {
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FingerPrint()));
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
