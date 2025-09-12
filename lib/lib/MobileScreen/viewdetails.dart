import 'package:flutter/material.dart';

class ViewDetailsScreen extends StatelessWidget {
  final Map<String, String> property;
  const ViewDetailsScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    final images = [
      property['image']!,
      'https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=800&q=80',
      'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=800&q=80',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Image carousel
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) => Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.black45,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.favorite_border, color: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title, price, rating, Reserve button
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  property['title'] ?? '',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Near University of St. La Salle, Bacolod City',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.orange, size: 20),
                                  SizedBox(width: 2),
                                  Text('4.8', style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                '₱18,000/month',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 12),
                              SizedBox(
                                width: 120,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                  ),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Reserve request sent!'),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Reserve',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Tabs
                      DefaultTabController(
                        length: 4,
                        child: Column(
                          children: [
                            TabBar(
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.grey,
                              indicatorColor: Colors.orange,
                              tabs: [
                                Tab(text: 'Overview'),
                                Tab(text: 'Amenities'),
                                Tab(text: 'Maps'),
                                Tab(text: 'Contacts'),
                              ],
                            ),
                            SizedBox(
                              height: 320,
                              child: TabBarView(
                                children: [
                                  // Overview
                                  SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 16),
                                        Text(
                                          'Description',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          'Experience comfortable student living at Sunset Dormitory. Located in the heart of downtown campus, this modern facility offers a perfect blend of comfort, convenience, and community. With spacious rooms, modern amenities, and a vibrant student atmosphere, Sunset Dormitory is your home away from home.',
                                          style: TextStyle(fontSize: 15, color: Colors.black87),
                                        ),
                                        SizedBox(height: 18),
                                        Text(
                                          'Key Features',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            featureItem('24/7 Security & Access Control'),
                                            featureItem('Study Rooms & Common Areas'),
                                            featureItem('Laundry Facilities'),
                                            featureItem('Close to Campus & Transportation'),
                                          ],
                                        ),
                                        SizedBox(height: 18),
                                        // Reviews & Ratings
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(16),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 8,
                                              ),
                                            ],
                                          ),
                                          padding: EdgeInsets.all(16),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Reviews & Ratings',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Icon(Icons.star, color: Colors.orange, size: 20),
                                                  SizedBox(width: 4),
                                                  Text('4.0', style: TextStyle(fontWeight: FontWeight.bold)),
                                                  SizedBox(width: 4),
                                                  Text('(3 reviews)', style: TextStyle(color: Colors.grey)),
                                                ],
                                              ),
                                              SizedBox(height: 14),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[100],
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                padding: EdgeInsets.all(14),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Write a Review',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    SizedBox(height: 8),
                                                    Text('Your Rating:'),
                                                    SizedBox(height: 4),
                                                    Row(
                                                      children: List.generate(5, (i) => Icon(Icons.star_border, color: Colors.grey)),
                                                    ),
                                                    SizedBox(height: 8),
                                                    TextField(
                                                      decoration: InputDecoration(
                                                        hintText: 'Share your experience about this place...',
                                                        filled: true,
                                                        fillColor: Colors.white,
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(8),
                                                          borderSide: BorderSide.none,
                                                        ),
                                                      ),
                                                      maxLines: 2,
                                                    ),
                                                    SizedBox(height: 10),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: Colors.orange,
                                                          foregroundColor: Colors.white,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(8),
                                                          ),
                                                        ),
                                                        onPressed: () {},
                                                        child: Text('Submit Review'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Amenities tab (make readable)
                                  SingleChildScrollView(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 16, left: 8, right: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Amenities',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          featureItem('24/7 Security & Access Control'),
                                          featureItem('Study Rooms & Common Areas'),
                                          featureItem('Laundry Facilities'),
                                          featureItem('Close to Campus & Transportation'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Maps tab
                                  Center(child: Text('Map location here')),
                                  // Contacts tab
                                  Center(child: Text('Contacts here')),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
          // You can add navigation for other indexes if needed
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Alerts'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }

  Widget featureItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(Icons.circle, color: Colors.orange, size: 8),
          SizedBox(width: 8),
          Expanded(child: Text(text, style: TextStyle(fontSize: 15))),
        ],
      ),
    );
  }
}