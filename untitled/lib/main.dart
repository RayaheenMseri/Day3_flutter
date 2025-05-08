import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String? localImagePath;
  final String? networkImageUrl;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.email,
    this.localImagePath,
    this.networkImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(localImagePath!),
            ),
            const SizedBox(height: 16.0),
            Text(
              name,
            ),
            const SizedBox(height: 8.0),
            Text(
              email,
            ),
            const SizedBox(height: 16.0),
            const Divider(),
            const SizedBox(height: 16.0),
            const Text(
              'Basic Information',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage('https://picsum.photos/200/300?grayscale'),
                ),
                SizedBox(width: 8.0),
                Text('iOS Developer'),
              ],
            ),
            const SizedBox(height: 8.0),
            const Row(
              children: <Widget>[
                Icon(Icons.location_on, color: Colors.grey),
                SizedBox(width: 8.0),
                Text('Madinah, Saudi Arabia'),
              ],
            ),
            // Add more basic info widgets here
          ],
        ),
      ),
    );
  }

}

// First Screen
class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Page"),
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
              foregroundColor: Colors.white,
            ),
            child: const Text("Go to profile screen"),
            onPressed: () {
              Get.to(() => const Second());
            },
          ),
        ),
      ),
    );
  }
}

// Second Screen (Profile Card Screen)
class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Screen"),
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ProfileCard(
                name: 'Rayaheen Mseri',
                email: 'Rayaheen@gmail.com.com',
                localImagePath: 'Asset/profile.jpg',
                networkImageUrl: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Inter',
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => First()),
        GetPage(name: '/second', page: () => const Second()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}