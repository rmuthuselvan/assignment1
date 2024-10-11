import 'package:flutter/material.dart';
import 'description_page.dart';
import 'package:share_plus/share_plus.dart'; // Import share_plus package

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Individual Meetup',
          style: TextStyle(
            color: Color.fromARGB(255, 20, 7, 7),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Share functionality
              Share.share('Check out this amazing meetup app!');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            SizedBox(height: 16),
            _buildSectionTitle('Popular Meetups'),
            _buildPopularMeetupsSection(),
            SizedBox(height: 16),
            _buildSectionTitle('Trending Popular People'),
            _buildTrendingPopularPeopleSection(),
            SizedBox(height: 16),
            _buildSectionTitle('Top Trending Meetups'),
            _buildTopTrendingMeetupsSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Helper method to create section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Search Bar Widget
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search), // Search icon
          suffixIcon: Icon(Icons.mic), // Voice input icon
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  // Popular Meetups Section
  Widget _buildPopularMeetupsSection() {
    return Container(
      height: 200,
      child: PageView.builder(
        itemCount: 3,
        controller: PageController(viewportFraction: 0.9),
        itemBuilder: (context, index) {
          String imagePath;
          switch (index) {
            case 0:
              imagePath = 'assets/meetup1.png';
              break;
            case 1:
              imagePath = 'assets/meetup2.jpeg';
              break;
            case 2:
              imagePath = 'assets/meetup3.jpeg';
              break;
            default:
              imagePath = 'assets/meetup1.png';
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                // Image with gradient overlay
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    'Popular Meetups in India',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Trending Popular People Section
  Widget _buildTrendingPopularPeopleSection() {
    List<String> imagePaths = [
      'assets/person1.jpeg',
      'assets/person2.jpeg',
      'assets/person3.jpeg',
    ];

    List<String> personNames = [
      'Ratan Tata',
      'Bill Gates',
      'Elon Musk',
    ];

    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePaths[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(8.0),
                  color: Colors.black54,
                  child: Text(
                    personNames[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Top Trending Meetups Section
  Widget _buildTopTrendingMeetupsSection() {
    List<String> meetupImagePaths = [
      'assets/trending1.png',
      'assets/trending2.png',
      'assets/trending3.png',
      'assets/trending4.png',
      'assets/trending5.png',
      'assets/trending6.png',
    ];

    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: meetupImagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DescriptionPage()),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(meetupImagePaths[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      color: Colors.black54,
                      child: Text(
                        'Meetup ${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Bottom Navigation Bar
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Prolet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Meetup',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
        ),
      ],
      unselectedItemColor: const Color.fromARGB(255, 26, 11, 11), // Change unselected icons to black
      selectedItemColor: Colors.black, // Change selected icon to black as well
      backgroundColor: Colors.white, // Set background color explicitly
    );
  }
}
