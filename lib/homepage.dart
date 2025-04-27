import 'package:flutter/material.dart';
import 'converterpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  mysnackBar(msg, context) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exchange"),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              mysnackBar("Search", context);
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              mysnackBar("Settings", context);
            },
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              mysnackBar("Profile", context);
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),

       drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.currency_exchange),
              title: const Text('Currency Converter'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ConverterPage()),
                );
              },
            ),
          ],
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.brown,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Welcome to the Exchange App!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
          ),

          // Now inside ListView, add GridView
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // Important! Disable GridView's scroll inside ListView
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              _buildGridItem(context, Icons.home, 'Home'),
              _buildGridItem(context, Icons.currency_exchange, 'Converter'),
              _buildGridItem(context, Icons.settings, 'Settings'),
              _buildGridItem(context, Icons.person, 'Profile'),
            ],
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          if (index == 0) {
            mysnackBar("Home", context);
          } else if (index == 1) {
            mysnackBar("Message", context);
          } else if (index == 2) {
            mysnackBar("Profile", context);
          }
        },
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mysnackBar("Return to top", context);
        },
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }

  // Small widget builder for Grid items
  Widget _buildGridItem(BuildContext context, IconData icon, String title) {
    return InkWell(
      onTap: () {
        mysnackBar(title, context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown.shade100,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.brown, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.brown),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.brown,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
