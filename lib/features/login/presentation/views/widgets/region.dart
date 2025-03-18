import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guessit_task/core/theme/color_app.dart';
import 'package:guessit_task/core/theme/styles.dart';
import 'package:guessit_task/features/login/presentation/views/widgets/job.dart';

class Region extends StatefulWidget {
  const Region({super.key});

  @override
  State<Region> createState() => _RegionState();
}

class _RegionState extends State<Region> {
  TextEditingController searchController = TextEditingController();

  List<String> countries = [
    "Egypt", "Saudi Arabia", "United Arab Emirates", "Kuwait", "Qatar",
    "Bahrain", "Oman", "Jordan", "Lebanon", "Iraq", "Syria", "Yemen",
    "Libya", "Tunisia", "Algeria", "Morocco", "Sudan", "Mauritania",
    "Palestine", "Somalia", "Djibouti", "Comoros"
  ];

  List<String> filteredCountries = [];
  String? selectedCountry; 

  @override
  void initState() {
    super.initState();
    filteredCountries = countries;
  }

  void filterSearchResults(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredCountries = countries;
      } else {
        filteredCountries = countries
            .where((country) => country.toLowerCase().contains(query.toLowerCase()))
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
              'Select your region',
              style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25),

            TextField(
              controller: searchController,
              onChanged: filterSearchResults,
              decoration: InputDecoration(
                hintText: "Search for a country...",
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
                        String country = filteredCountries[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              shape: CircleBorder(),
                              side: BorderSide(color: ColorApp.primaryColor),
                              value: selectedCountry == country, 
                              activeColor: ColorApp.primaryColor,
                              onChanged: (bool? value) {
                                setState(() {
                                  selectedCountry = value == true ? country : null;
                                });
                              },
                            ),
                          ),
                          title: Text(country),
                          onTap: () {
                            setState(() {
                              selectedCountry = selectedCountry == country ? null : country;
                            });
                          },
                        );
                      },
                    )
                  : Center(child: Text("No matching countries found!", style: Styles.textStyle16)),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedCountry != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Job()),
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
