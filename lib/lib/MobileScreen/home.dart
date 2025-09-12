import 'package:flutter/material.dart';
import 'package:cozydorm/MobileScreen/viewdetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final orange = Color(0xFFFF9800);

  int _selectedIndex = 0;
  String dormSearch = '';
  String selectedFilter = 'All';

  final List<String> filters = [
    'All',
    'Near Campus',
    'City Center',
    'Budget',
  ];

  final List<Map<String, String>> featuredProperties = [
    {
      'image': 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80',
      'location': 'Near Campus',
      'title': 'Premium Student Housing',
      'desc': 'Luxury amenities, close to university',
      'type': 'Near Campus',
    },
    {
      'image': 'https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=800&q=80',
      'location': 'City Center',
      'title': 'Urban Dorms',
      'desc': 'Modern rooms, walk to everything',
      'type': 'City Center',
    },
    {
      'image': 'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=800&q=80',
      'location': 'Near Campus',
      'title': 'Budget Dorms',
      'desc': 'Affordable rooms for students',
      'type': 'Budget',
    },
  ];

  List<Map<String, String>> get filteredProperties {
    List<Map<String, String>> list = featuredProperties;
    if (selectedFilter != 'All') {
      list = list.where((prop) => prop['type'] == selectedFilter).toList();
    }
    if (dormSearch.isNotEmpty) {
      list = list.where((prop) =>
        prop['title']!.toLowerCase().contains(dormSearch.toLowerCase()) ||
        prop['location']!.toLowerCase().contains(dormSearch.toLowerCase()) ||
        prop['desc']!.toLowerCase().contains(dormSearch.toLowerCase())
      ).toList();
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          String label = [
            'Home',
            'Search',
            'Wishlist',
            'Messages',
            'Alerts',
            'Profile'
          ][index];
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$label tab selected'),
              duration: Duration(milliseconds: 800),
            ),
          );
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: orange,
                width: double.infinity,
                padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello, John!',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Find your perfect home',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.notifications_none, color: Colors.white, size: 28),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('No new notifications'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            dormSearch = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Search for dorms...',
                          prefixIcon: Icon(Icons.search, color: orange),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Featured Properties',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Filter chips
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: filters.map((filter) => Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(filter),
                        selected: selectedFilter == filter,
                        selectedColor: orange,
                        backgroundColor: Colors.grey[200],
                        labelStyle: TextStyle(
                          color: selectedFilter == filter ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                        onSelected: (selected) {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                      ),
                    )).toList(),
                  ),
                ),
              ),
              SizedBox(height: 14),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: filteredProperties.isEmpty
                    ? [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 40),
                          child: Center(
                            child: Text(
                              'No properties found.',
                              style: TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ),
                        ),
                      ]
                    : filteredProperties.map((prop) => Container(
                      margin: EdgeInsets.only(bottom: 28),
                      height: 270,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 16,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: Image.network(
                              prop['image'] ?? '',
                              height: 270,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                              loadingBuilder: (context, child, progress) =>
                                progress == null
                                  ? child
                                  : Container(
                                      height: 270,
                                      width: double.infinity,
                                      color: Colors.grey[200],
                                      child: Center(child: CircularProgressIndicator()),
                                    ),
                              errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  height: 270,
                                  width: double.infinity,
                                  color: Colors.grey[300],
                                  child: Icon(Icons.broken_image, color: Colors.grey, size: 48),
                                ),
                            ),
                          ),
                          // Subtle black gradient for readability
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            height: 130,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(28),
                                bottomRight: Radius.circular(28),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.75),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Card content
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Padding(
                              padding: EdgeInsets.all(28),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.location_on, color: Colors.red, size: 20),
                                      SizedBox(width: 8),
                                      Text(
                                        prop['location'] ?? '',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          shadows: [Shadow(blurRadius: 2, color: Colors.black38)],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    prop['title'] ?? '',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 0.2,
                                      shadows: [Shadow(blurRadius: 3, color: Colors.black45)],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    prop['desc'] ?? '',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white.withOpacity(0.95),
                                      shadows: [Shadow(blurRadius: 2, color: Colors.black38)],
                                    ),
                                  ),
                                  SizedBox(height: 22),
                                  SizedBox(
                                    width: 150,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 14),
                                        elevation: 2,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => ViewDetailsScreen(property: prop),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'View Details',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}