import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/backend/functions.dart';
import 'package:news_app/utils/colors.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key, required this.onSearch});

  final VoidCallback onSearch;

  @override
  State<Searchbar> createState() => _SearchbarState();

  static TextEditingController searchcontroller = TextEditingController(
    text: '',
  );
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.darkgrey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 30),
                  Expanded(
                    child: TextField(
                      controller: Searchbar.searchcontroller,
                      decoration: InputDecoration(
                        hintText: 'Search a Keyword or a Phrase',
                        hintStyle: GoogleFonts.lato(),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(45),
          onTap: () {
            FocusScope.of(context).unfocus();
            widget.onSearch();
          },
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.darkgrey,
            ),
            child: Icon(Icons.search, color: AppColors.white),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
