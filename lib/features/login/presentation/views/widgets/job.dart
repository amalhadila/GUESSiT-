import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guessit_task/core/theme/color_app.dart';
import 'package:guessit_task/core/theme/styles.dart';
import 'package:guessit_task/features/home/presentation/views/home_view.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/experience.dart';

class Job extends StatefulWidget {
  const Job({super.key});

  @override
  State<Job> createState() => _JobState();
}

class _JobState extends State<Job> {
    String selectedUserType = "Find a job";

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
             Image.asset('assets/Logo(1).png', height: 87.h, width: 175.w),
            
            const SizedBox(height: 20),
            Text(
              'Choose whether you looking for a job or you are a company looking for employee',
               textAlign: TextAlign.center,
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w500,color: Color(0xff808080)),
            ),
             const SizedBox(height: 25),
            Text(
              'Choose your job type',
               textAlign: TextAlign.center,
              style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userTypeOption("Find a job", selectedUserType == "Find a job"),
                const SizedBox(width: 10),
                userTypeOption("Find an Employee", selectedUserType == "Find an Employee"),
              ],
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedUserType != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Experience()),
                        );
                      }
                    : null, 
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
  Widget userTypeOption(String title, bool selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedUserType = title;
        });
      },
      child: Container(
        width: 115.w,
        height: 130.h,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10).r,
        decoration: BoxDecoration(
          border: Border.all(color: selected ? Colors.blue : Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: selected ? Colors.white : const Color.fromARGB(255, 252, 249, 249),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Icon(Icons.person, color: selected ? Colors.blue : Colors.black),
            Text(
              title,
              style: TextStyle(
                color:  Colors.black ,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
