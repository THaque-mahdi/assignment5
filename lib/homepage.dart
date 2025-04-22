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
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.currency_exchange),
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

      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0), // Adds margin around the container
          padding: const EdgeInsets.all(20.0), // Adds padding inside the container
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.brown, // Border color
              width: 2.0, // Border width
            ),
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
          ),
          child: const Text(
            "Welcome to the Exchange App!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          if (index == 0) {
            mysnackBar("Home", context);
          } else if (index == 1) {
            mysnackBar("Message", context);
          } else if (index == 2) {
            mysnackBar("Notification", context);
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
            icon: Icon(Icons.notifications),
            label: "Notifications",
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mysnackBar("Return to top", context);
        },
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}