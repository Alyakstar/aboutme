import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Me',
      home: AboutPage(),
    );
  }
}

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final List<Map<String, String>> funFacts = [
    {
      'text':
          'Suka makan kepiting mentega yang banyak bawang putihnya, padahal pas kecil takut bawang putih.',
      'image': 'assets/photos/kepiting.jpg'
    },
    {
      'text': 'Kalau makan timun, cuma suka pinggirannya aja, nggak suka bijinya.',
      'image': 'assets/photos/timun.jpg'
    },
    {
      'text': 'Ngefans sama Jisung NCT dari kelas 6 sampai sekarang.',
      'image': 'assets/photos/jisung.jpg'
    },
    {
      'text': 'Obses sama barang yang warnanya mint.',
      'image': 'assets/photos/mint.png'
    },
    {
      'text': 'Susah buat ngafalin rute jalan.',
      'image': 'assets/photos/jalan.jpg'
    },
  ];

  List<int> tappedIndexes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
        backgroundColor: Colors.teal.shade300,
      ),
      body: Container(
        color: Colors.teal.shade50,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/photos/profile.jpg'),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Alya Callysta Nugraha',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade900,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'NRP: 5026221018',
                style: TextStyle(fontSize: 16, color: Colors.teal.shade700),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Fun Facts:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: funFacts.length,
                itemBuilder: (context, index) {
                  bool isTapped = tappedIndexes.contains(index);

                  return Card(
                    color: isTapped
                        ? Colors.teal.shade100
                        : Colors.teal.shade200, // Change color if tapped
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      leading: Image.asset(
                        funFacts[index]['image']!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        'Fun Fact ${index + 1}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade900,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          if (isTapped) {
                            tappedIndexes.remove(index); // Toggle tapped state
                          } else {
                            tappedIndexes.add(index); // Mark as tapped
                          }
                        });

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(funFacts[index]['image']!),
                                SizedBox(height: 10),
                                Text(
                                  funFacts[index]['text']!,
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
