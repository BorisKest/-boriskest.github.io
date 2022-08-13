import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Portfolio(),
    ),
  );
}

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  static Future _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 14, 13, 13),
            Color.fromARGB(255, 53, 46, 46)
          ], transform: GradientRotation(-10)),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    'Boris Kastner \nFlutter developer',
                    style: GoogleFonts.jura(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2,
                    left: MediaQuery.of(context).size.width * 0.2,
                  ),
                  child: Text('hi',
                      style: GoogleFonts.londrinaShadow(
                          color: Colors.white, fontSize: 128))),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.4,
                  left: MediaQuery.of(context).size.width * 0.8,
                ),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        _launchUrl(Uri.parse('https://github.com/BorisKest'));
                      },
                      child: Text(
                        'GirHub',
                        style: GoogleFonts.jura(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _launchUrl(Uri.parse(
                            'https://www.linkedin.com/in/boris-kastner/'));
                      },
                      child: Text(
                        'Linked In',
                        style: GoogleFonts.jura(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
