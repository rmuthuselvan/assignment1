import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart'; // Add this import

class DescriptionPage extends StatefulWidget {
  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  int _currentIndex = 0; // Keep track of the selected index for BottomNavigationBar

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index; // This updates the selected tab
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
      unselectedItemColor: const Color.fromARGB(255, 26, 11, 11), // Unselected icons color
      selectedItemColor: Colors.black, // Selected icon color
      backgroundColor: Colors.white, // Background color
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Carousel with Minimum 3 Images
            Container(
              height: 250,
              child: PageView(
                children: [
                  Image.asset('assets/plase1.jpg', fit: BoxFit.cover),
                  Image.asset('assets/plase2.png', fit: BoxFit.cover),
                  Image.asset('assets/plase3.png', fit: BoxFit.cover),
                ],
              ),
            ),
            SizedBox(height: 20), // Space between the carousel and buttons

            // Action Buttons (Share, Favorite, Rating)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Share Button
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    final RenderBox box = context.findRenderObject() as RenderBox;
                    Share.share('Check out this event!',
                        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
                  },
                ),
                // Favorite Button
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {
                    // Add to favorites functionality here
                  },
                ),
                // Ratings Section
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 4),
                    Text('3.2'),
                    SizedBox(width: 4),
                    Text('(1034 ratings)'),
                  ],
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Actor Name
                  Row(
                    children: [
                      Text(
                        'Actor Name: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Indian Actress',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Duration
                  Row(
                    children: [
                      Icon(Icons.access_time),
                      SizedBox(width: 8),
                      Text('Duration 20 mins'),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Fees
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 8),
                      Text('Total Average Fees ₹9,999'),
                    ],
                  ),
                  SizedBox(height: 20),
                  // About Section
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'From cardiovascular health to fitness, flexibility, '
                    'balance, stress relief, better sleep, increased cognitive '
                    'performance, and more, you can reap all of these benefits in just '
                    'one session out on the waves. So, you may find yourself '
                    'wondering what are the benefits of going on a surf camp.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(), // Attach BottomNavigationBar
    );
  }
}
