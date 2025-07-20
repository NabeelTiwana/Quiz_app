import 'package:flutter/material.dart';

import '../data/data.dart';
import 'category_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Test your skills',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'prepare yourself for any exam !',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.white70,
                  ),
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(15),
                  itemCount: Data.categories.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        (MediaQuery.of(context).size.height - 50 - 25) /
                        (4 * 240),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final category = Data.categories[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CategoryScreen(category: category),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.all(10)),
                            Image.asset(category.image),
                            SizedBox(height: 10),
                            Text(
                              category.name,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withValues(alpha: 0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
