import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';
import 'package:flutter_firebase_login/src/features/core/screens/dashboard/widgets/widgets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    //variables
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: const DashboardAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(cDefaultPaddingValue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //HEADING
              Text(
                'Hey, User',
                style: textTheme.headlineSmall,
              ),
              Text(
                'Dashboard Heading',
                style: textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              //SEARCH BOX
              const SearchBox(),
              const SizedBox(height: 10),
              //CATEGORIES
              const DashboardCategories(),
              const SizedBox(height: 15),
              //BANNERS
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BannerTile(isDark: isDark, textTheme: textTheme),
                  const SizedBox(width: 10),
                  BannerTile(isDark: isDark, textTheme: textTheme),
                ],
              ),
              //VIEW ALL BUTTON
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('View All'),
                ),
              ),
              const SizedBox(height: 15),
              //TOP PICKS / FEATURED
              Text('FEATURED', style: textTheme.headlineSmall),
              const SizedBox(height: 15),
              SizedBox(
                height: 220,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    FeaturedTile(),
                    SizedBox(width: 10),
                    FeaturedTile(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
