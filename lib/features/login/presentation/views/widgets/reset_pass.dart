import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guessit_task/core/theme/color_app.dart';
import 'package:guessit_task/core/theme/styles.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/job.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/otp.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  String? selectedOption; 
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
              'Forget Password',
              style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            Text(
              'Select which contact details should we use to reset your password',
              textAlign: TextAlign.center,
              style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.w500,
                color: const Color(0xff808080),
              ),
            ),
            const SizedBox(height: 25),

            _buildOption(
              icon: Icons.sms,
              title: "Via SMS",
              subtitle: "+0201*******78",
              value: "sms",
            ),
            const SizedBox(height: 16),
            _buildOption(
              icon: Icons.email,
              title: "Via Email",
              subtitle: "m********@yahoo.com",
              value: "email",
            ),
            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedOption != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Otp()),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(271.w, 50.h),
                  backgroundColor: selectedOption != null
                      ? ColorApp.primaryColor
                      : Colors.grey, 
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

  Widget _buildOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required String value, 
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selectedOption == value ? ColorApp.primaryColor : Colors.grey.shade300,
            width: 2, 
          ),
          color: selectedOption == value ? Colors.blue.shade50 : Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: selectedOption == value ? ColorApp.primaryColor : Colors.black54,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: selectedOption == value ? ColorApp.primaryColor : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
