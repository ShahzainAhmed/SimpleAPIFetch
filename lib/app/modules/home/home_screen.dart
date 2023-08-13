import 'package:api_practice/app/data/constants/app_colors.dart';
import 'package:api_practice/app/data/constants/app_typography.dart';
import 'package:api_practice/app/services/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchAPI();
  }

  List<dynamic> movies = [];

  void fetchAPI() async {
    List<dynamic> jsonData = await ApiService().fetchMovies();
    setState(() {
      movies = jsonData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(
          color: AppColors.kBlackColor,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              movies[index]["Title"],
              style: AppTypography.kMedium16,
            ),
            subtitle: Text(
              movies[index]["Plot"],
              style: AppTypography.kMedium16,
            ),
          );
        },
      ),
    );
  }
}
