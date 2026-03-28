import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet(
  BuildContext context,
  String title,
  description,
  imageurl,
  url,
) {
  showBottomSheet(
    context: context,
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    elevation: 20,
    builder: (context) {
      return MyBottomSheetLayout(
        url: url,
        imageurl: imageurl,
        title: title,
        description: description,
      );
    },
  );
}

void _launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, imageurl, url;
  const MyBottomSheetLayout({
    super.key,
    required this.title,
    required this.description,
    required this.imageurl,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 300,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(imageurl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 300,
                    child: BoldText(text: title, size: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: ModifiedText(
              text: description,
              size: 16,
              color: Colors.white,
            ),
          ),

          Container(
            padding: EdgeInsets.all(20),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Read Full Article',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _launchURL(url);
                      },
                    style: GoogleFonts.lato(color: Colors.blue.shade400),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
