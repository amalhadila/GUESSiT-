import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guessit_task/core/theme/color_app.dart';
import 'package:guessit_task/core/theme/styles.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/job.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/profile.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  TextEditingController searchController = TextEditingController();

  List<String> Experience =[
  "Mobile App Development",
  "Web Development",
  "Backend Development",
  "Frontend Development",
  "Full-Stack Development",
  "UI/UX Design",
  "Software Engineering",
  "Cloud Computing",
  "DevOps & CI/CD",
  "Cybersecurity",
  "Data Science & AI",
  "Machine Learning",
  "Blockchain Development",
  "Game Development",
  "Embedded Systems & IoT",
  "Database Management",
  "AR/VR Development",
  "Business Intelligence (BI)",
  "Testing & QA"
];

  List<String> filteredCountries = [];
  String? selectedExperience; 

  @override
  void initState() {
    super.initState();
    filteredCountries = Experience;
  }

  void filterSearchResults(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredCountries = Experience;
      } else {
        filteredCountries = Experience
            .where((Experience) => Experience.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
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
             Image.asset('assets/Logo(1).png', height: 87.h, width: 175.w),
           
            const SizedBox(height: 10),
            Text(
              'Select your experience',
              style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25),

            TextField(
              controller: searchController,
              onChanged: filterSearchResults,
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search, color: ColorApp.primaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: ColorApp.primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: filteredCountries.isNotEmpty
                  ? ListView.builder(
                      itemCount: filteredCountries.length,
                      itemBuilder: (context, index) {
                        String Experience = filteredCountries[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
                              side: BorderSide(color: ColorApp.primaryColor),
                              value: selectedExperience == Experience, 
                              activeColor: ColorApp.primaryColor,
                              onChanged: (bool? value) {
                                setState(() {
                                  selectedExperience = value == true ? Experience : null;
                                });
                              },
                            ),
                          ),
                          title: Text(Experience),
                          onTap: () {
                            setState(() {
                              selectedExperience = selectedExperience == Experience ? null : Experience;
                            });
                          },
                        );
                      },
                    )
                  : Center(child: Text("No matching Experience found!", style: Styles.textStyle16)),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedExperience != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  Profile()),
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
}
