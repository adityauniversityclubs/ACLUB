// import 'package:aclub/views/club/events.dart';
// import 'package:aclub/views/events/event_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:aclub/views/events/thb.dart';


// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
//   final int _currentCarouselIndex = 0;
//   // In your state class
//   final CarouselController _carouselController = CarouselController();
//   // final CarouselSliderController _carouselController = CarouselSliderController();
//   final ScrollController _scrollController = ScrollController();
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;
  
//   bool _isLoading = true;

//   final List<String> carouselItems = [
//     'assets/ob/ob1.jpg',
//     'assets/ob/ob2.jpg',
//     'assets/ob/ob3.jpg',
//   ];

//   final List<Map<String, dynamic>> events = [
//     {'title': 'Leadership Workshop', 'date': 'March 25', 'image': 'assets/ob/ob1.jpg', 'club': 'LEO Club'},
//     {'title': 'Music Festival', 'date': 'April 2', 'image': 'assets/ob/ob2.jpg', 'club': 'SAC'},
//     {'title': 'Coding Challenge', 'date': 'April 5', 'image': 'assets/ob/ob3.jpg', 'club': 'IEDC'},
//     {'title': 'Cultural Night', 'date': 'April 8', 'image': 'assets/ob/ob1.jpg', 'club': 'NSS'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOut,
//       ),
//     );
//     _animationController.forward();
//     Future.delayed(const Duration(seconds: 2), () {
//       setState(() {
//         _isLoading = false;
//       });
//     });
//   }



//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: theme.colorScheme.surface,
//       body: _isLoading ? _buildLoadingIndicator() : _buildContent(theme, size),
//       bottomNavigationBar: _buildBottomAppBar(theme),
//     );
//   }

//   Widget _buildLoadingIndicator() {
//     return Center(
//       child: Shimmer.fromColors(
//         baseColor: Colors.grey[300]!,
//         highlightColor: Colors.grey[100]!,
//         child: Container(
//           width: 100,
//           height: 100,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }

//   Widget _buildContent(ThemeData theme, Size size) {
//     return CustomScrollView(
//       controller: _scrollController,
//       slivers: [
//         _buildAppBar(theme),
//         SliverList(
//           delegate: SliverChildListDelegate([
//             _buildCarouselSection(size),
//             const SizedBox(height: 24),
//             _buildSectionHeader('Clubs', onSeeAll: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => MyEPage()));
//             }),
//             _buildCategoryRow(),
//             _buildSectionHeader('Happening events', onSeeAll: () {}),
//             _buildListeningSection(),
//             const SizedBox(height: 20),
//             _buildSectionHeader('Events Ongoing', onSeeAll: () {}),
//             _buildEventGrid(),
//             const SizedBox(height: 18),
//             _buildSectionHeader('Latest News', onSeeAll: () {}),
//             _buildNewsList(),
//             const SizedBox(height: 20),
//           ]),
//         ),
//       ],
//     );
//   }

//   Widget _buildEventGrid() {
//     return GridView.builder(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 0.8,
//         mainAxisSpacing: 15,
//         crossAxisSpacing: 15,
//       ),
//       itemCount: events.length,
//       itemBuilder: (context, index) => _buildEventCard(index),
//     );
//   }

//   Widget _buildEventCard(int index) {
//     return GestureDetector(
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => EventScreen()),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           image: DecorationImage(
//             image: AssetImage(events[index]['image']),
//             fit: BoxFit.cover,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 10,
//               spreadRadius: 2,
//             ),
//           ],
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             gradient: LinearGradient(
//               begin: Alignment.bottomCenter,
//               end: Alignment.topCenter,
//               colors: [
//                 Colors.black.withOpacity(0.6),
//                 Colors.transparent,
//               ],
//             ),
//           ),
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 events[index]['date'],
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 12,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Text(
//                 events[index]['title'],
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               const SizedBox(height: 4),
//               Row(
//                 children: [
//                   const Icon(Iconsax.clock, color: Colors.white, size: 12),
//                   const SizedBox(width: 4),
//                   Text(
//                     '6:00 PM',
//                     style: TextStyle(
//                       color: Colors.white.withOpacity(0.9),
//                       fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Additional methods for building other sections...

//   Widget _buildNewsList() {
//     return ListView.separated(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: 3,
//       separatorBuilder: (_, __) => const SizedBox(height: 15),
//       itemBuilder: (context, index) => _buildNewsCard(index),
//     );
//   }

//   Widget _buildNewsCard(int index) {
//     final List<Map<String, dynamic>> newsItems = [
//       {
//         'title': 'New Club Registration Open',
//         'excerpt': 'Register your new student organization before April 30...',
//         'date': '2h ago'
//       },
//       {
//         'title': 'Annual Fest Schedule Released',
//         'excerpt': 'Check out the complete schedule for this year\'s college fest...',
//         'date': '5h ago'
//       },
//       {
//         'title': 'Leadership Workshop Results',
//         'excerpt': 'View the results of the inter-college leadership workshop...',
//         'date': '1d ago'
//       },
//     ];

//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 width: 40,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.blue.withOpacity(0.1),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(Iconsax.info_circle, color: Colors.blue),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       newsItems[index]['title'],
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 14,
//                       ),
//                     ),
//                     Text(
//                       newsItems[index]['date'],
//                       style: TextStyle(
//                         color: Colors.grey.shade600,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           Text(
//             newsItems[index]['excerpt'],
//             style: TextStyle(
//               color: Colors.grey.shade700,
//               fontSize: 13,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Other methods remain unchanged...

//   Widget _buildBottomAppBar(ThemeData theme) {
//     return BottomAppBar(
//       shape: const CircularNotchedRectangle(),
//       notchMargin: 8,
//       child: Container(
//         height: 60,
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             IconButton(
//               icon: Icon(Iconsax.home, color: theme.colorScheme.primary),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Iconsax.message, color: Colors.grey.shade500),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Iconsax.user, color: Colors.grey.shade500),
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildNotificationBadge() {
//     return Stack(
//       children: [
//         IconButton(
//           icon: Icon(Iconsax.notification, color: Theme.of(context).colorScheme.onSurface),
//           onPressed: () {},
//         ),
//         Positioned(
//           right: 8,
//           top: 7,
//           child: Container(
//             padding: const EdgeInsets.all(2),
//             decoration: const BoxDecoration(
//               color: Colors.red,
//               shape: BoxShape.circle,
//             ),
//             constraints: const BoxConstraints(
//               minWidth: 13,
//               minHeight: 13,
//             ),
//             child: const Text(
//               '3',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//   Widget _buildListeningSection() {
//     return SizedBox(
//       height: 150,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [
//           _buildListeningCard('assets/ob/ob3.jpg', 'LEO EVENT 8/12'),
//           _buildListeningCard('assets/ob/ob2.jpg', 'ROT EVENT 15/20'),
//           _buildListeningCard('assets/ob/ob1.jpg', 'NSS EVENT 5/15'),
//           _buildListeningCard('assets/ob/ob4.jpg', 'LEO EVENT 10/12'),
//           _buildListeningCard('assets/ob/ob2.jpg', 'ROT EVENT 15/20'),
//           _buildListeningCard('assets/ob/ob1.jpg', 'NSS EVENT 5/15'),
//         ],
//       ),
//     );
//   }

//   Widget _buildKnowledgeSection() {
//     return SizedBox(
//       height: 150,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [
//           _buildListeningCard('assets/ob/ob3.jpg', 'Knowledge Event 1'),
//           _buildListeningCard('assets/ob/ob2.jpg', 'Knowledge Event 2'),
//           _buildListeningCard('assets/ob/ob1.jpg', 'Knowledge Event 3'),
//           _buildListeningCard('assets/ob/ob4.jpg', 'Knowledge Event 4'),
//           _buildListeningCard('assets/ob/ob2.jpg', 'Knowledge Event 5'),
//           _buildListeningCard('assets/ob/ob1.jpg', 'Knowledge Event 6'),
//         ],
//       ),
//     );
//   }

//   Widget _buildledgeSection() {
//     return SizedBox(
//       height: 150,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [
//           _buildListeningCard('assets/ob/ob2.jpg', 'LEO EVENT 8/42'),
//           _buildListeningCard('assets/ob/ob1.jpg', 'ROT EVENT 15/30'),
//           _buildListeningCard('assets/ob/ob3.jpg', 'NSS EVENT 5/11'),
//           _buildListeningCard('assets/ob/ob4.jpg', 'LEO EVENT 3/12'),
//           _buildListeningCard('assets/ob/ob1.jpg', 'ROT EVENT 5/10'),
//           _buildListeningCard('assets/ob/ob3.jpg', 'NSS EVENT 5/13'),
//         ],
//       ),
//     );
//   }

//   Widget _buildCategoryRow() {
//     return SizedBox(
//       height: 120,
//       child: ListView.separated(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         scrollDirection: Axis.horizontal,
//         itemCount: 6,
//         separatorBuilder: (_, __) => const SizedBox(width: 16),
//         itemBuilder: (context, index) => _buildCategoryItem(index),
//       ),
//     );
//   }

//   Widget _buildCategoryItem(int index) {
//     final List<Map<String, dynamic>> categories = [
//       {'name': 'SAC', 'image': 'assets/clublogo/SAC.png', 'color': Colors.grey},
//       {'name': 'LEO', 'image': 'assets/clublogo/LEO.png', 'color': Colors.grey},
//       {'name': 'GDG', 'image': 'assets/clublogo/GDG.png', 'color': Colors.grey},
//       {'name': 'ROT', 'image': 'assets/clublogo/ROT.png', 'color': Colors.grey},
//       {'name': 'NSS', 'image': 'assets/clublogo/NSS.png', 'color': Colors.grey},
//       {'name': 'RED', 'image': 'assets/clublogo/RED.png', 'color': Colors.grey},
//     ];

//     return GestureDetector(
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => MyEPage()),
//       ),
//       child: Column(
//         children: [
//           Container(
//             width: 70,
//             height: 70,
//             decoration: BoxDecoration(
//               color: categories[index]['color'].withOpacity(0.1),
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: categories[index]['color'].withOpacity(0.3),
//                 width: 2,
//               ),
//             ),
//             child: ClipOval(
//               child: Image.asset(
//                 categories[index]['image'],
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 height: double.infinity,
//                 errorBuilder: (context, error, stackTrace) => Icon(
//                   Icons.error,
//                   color: Colors.red,
//                   size: 30,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             categories[index]['name'],
//             style: const TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _buildCarouselSection(Size size) {
//     return Column(
//       children: [
//         CarouselSlider(
//           items: carouselItems.map((item) => _buildCarouselItem(item, size)).toList(),
//           options: CarouselOptions(
//             height: size.height * 0.25,
//             autoPlay: true,
//             enlargeCenterPage: true,
//             viewportFraction: 0.8,
//             onPageChanged: (index, reason) {
//               setState(() => _currentCarouselIndex = index);
//             },
//           ),
//           carouselController: _carouselController,
//         ),
//         const SizedBox(height: 12),
//         _buildCarouselIndicators(),
//       ],
//     );
//   }

//   Widget _buildCarouselItem(String imagePath, Size size) {
//   return Container(
//     decoration: BoxDecoration(
//       image: DecorationImage(
//         image: AssetImage(imagePath),
//         fit: BoxFit.cover,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           gradient: LinearGradient(
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//             colors: [
//               Colors.black.withOpacity(0.6),
//               Colors.transparent,
//             ],
//           ),
//         ),
//         child: Align(
//           alignment: Alignment.bottomLeft,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Club Spotlight',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 shadows: [
//                   Shadow(
//                     color: Colors.black.withOpacity(0.3),
//                     blurRadius: 4,
//                     offset: const Offset(2, 2),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCarouselIndicators() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: carouselItems.asMap().entries.map((entry) {
//         return GestureDetector(
//           onTap: () => _carouselController.jumpToPage(entry.key),
//           child: Container(
//             width: 8.0,
//             height: 8.0,
//             margin: const EdgeInsets.symmetric(horizontal: 4.0),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: _currentCarouselIndex == entry.key
//                   ? Colors.blue
//                   : Colors.grey.withOpacity(0.4),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildListeningCard(String imagePath, String episode) {
//     return Container(
//       width: 150,
//       margin: const EdgeInsets.only(left: 16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         image: DecorationImage(
//           image: AssetImage(imagePath),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Align(
//         alignment: Alignment.bottomLeft,
//         child: Container(
//           padding: const EdgeInsets.all(8),
//           color: Colors.black54,
//           child: Text(
//             episode,
//             style: const TextStyle(color: Colors.white, fontSize: 12),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCategoryRow() {
//     return SizedBox(
//       height: 120,
//       child: ListView.separated(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         scrollDirection: Axis.horizontal,
//         itemCount: 6,
//         separatorBuilder: (_, __) => const SizedBox(width: 16),
//         itemBuilder: (context, index) => _buildCategoryItem(index),
//       ),
//     );
//   }

//   Widget _buildCategoryItem(int index) {
//     final List<Map<String, dynamic>> categories = [
//       {'name': 'SAC', 'image': 'assets/clublogo/SAC.png', 'color': Colors.grey},
//       {'name': 'LEO', 'image': 'assets/clublogo/LEO.png', 'color': Colors.grey},
//       {'name': 'GDG', 'image': 'assets/clublogo/GDG.png', 'color': Colors.grey},
//       {'name': 'ROT', 'image': 'assets/clublogo/ROT.png', 'color': Colors.grey},
//       {'name': 'NSS', 'image': 'assets/clublogo/NSS.png', 'color': Colors.grey},
//       {'name': 'RED', 'image': 'assets/clublogo/RED.png', 'color': Colors.grey},
//     ];

//     return GestureDetector(
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => MyEPage()),
//       ),
//       child: Column(
//         children: [
//           Container(
//             width: 70,
//             height: 70,
//             decoration: BoxDecoration(
//               color: categories[index]['color'].withOpacity(0.1),
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: categories[index]['color'].withOpacity(0.3),
//                 width: 2,
//               ),
//             ),
//             child: ClipOval(
//               child: Image.asset(
//                 categories[index]['image'],
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 height: double.infinity,
//                 errorBuilder: (context, error, stackTrace) => Icon(
//                   Icons.error,
//                   color: Colors.red,
//                   size: 30,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             categories[index]['name'],
//             style: const TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildEventGrid() {
//     return GridView.builder(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 0.8,
//         mainAxisSpacing: 15,
//         crossAxisSpacing: 15,
//       ),
//       itemCount: events.length,
//       itemBuilder: (context, index) => _buildEventCard(index),
//     );
//   }

//   Widget _buildEventCard(int index) {
//     return GestureDetector(
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => EventScreen(),
//         ),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           image: DecorationImage(
//             image: AssetImage(events[index]['image']),
//             fit: BoxFit.cover,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 10,
//               spreadRadius: 2,
//             ),
//           ],
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             gradient: LinearGradient(
//               begin: Alignment.bottomCenter,
//               end: Alignment.topCenter,
//               colors: [
//                 Colors.black.withOpacity(0.6),
//                 Colors.transparent,
//               ],
//             ),
//           ),
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 events[index]['date'],
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 12,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Text(
//                 events[index]['title'],
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               const SizedBox(height: 4),
//               Row(
//                 children: [
//                   const Icon(Iconsax.clock, color: Colors.white, size: 12),
//                   const SizedBox(width: 4),
//                   Text(
//                     '6:00 PM',
//                     style: TextStyle(
//                       color: Colors.white.withOpacity(0.9),
//                       fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildNewsList() {
//     return ListView.separated(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: 3,
//       separatorBuilder: (_, __) => const SizedBox(height: 15),
//       itemBuilder: (context, index) => _buildNewsCard(index),
//     );
//   }

//   Widget _buildNewsCard(int index) {
//     final List<Map<String, dynamic>> newsItems = [
//       {
//         'title': 'New Club Registration Open',
//         'excerpt': 'Register your new student organization before April 30...',
//         'date': '2h ago'
//       },
//       {
//         'title': 'Annual Fest Schedule Released',
//         'excerpt': 'Check out the complete schedule for this year\'s college fest...',
//         'date': '5h ago'
//       },
//       {
//         'title': 'Leadership Workshop Results',
//         'excerpt': 'View the results of the inter-college leadership workshop...',
//         'date': '1d ago'
//       },
//     ];

//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 width: 40,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.blue.withOpacity(0.1),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(Iconsax.info_circle, color: Colors.blue),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       newsItems[index]['title'],
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 14,
//                       ),
//                     ),
//                     Text(
//                       newsItems[index]['date'],
//                       style: TextStyle (color: Colors.grey.shade600,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           Text(
//             newsItems[index]['excerpt'],
//             style: TextStyle(
//               color: Colors.grey.shade700,
//               fontSize: 13,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildListeningSection() {
//     return SizedBox(
//       height: 150,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [
//           _buildListeningCard('assets/ob/ob3.jpg', 'LEO EVENT 8/12'),
//           _buildListeningCard('assets/ob/ob2.jpg', 'ROT EVENT 15/20'),
//           _buildListeningCard('assets/ob/ob1.jpg', 'NSS EVENT 5/15'),
//           _buildListeningCard('assets/ob/ob4.jpg', 'LEO EVENT 10/12'),
//           _buildListeningCard('assets/ob/ob2.jpg', 'ROT EVENT 15/20'),
//           _buildListeningCard('assets/ob/ob1.jpg', 'NSS EVENT 5/15'),
//         ],
//       ),
//     );
//   }

//   Widget _buildListeningCard(String imagePath, String episode) {
//     return Container(
//       width: 150,
//       margin: const EdgeInsets.only(left: 16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         image: DecorationImage(
//           image: AssetImage(imagePath),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Align(
//         alignment: Alignment.bottomLeft,
//         child: Container(
//           padding: const EdgeInsets.all(8),
//           color: Colors.black54,
//           child: Text(
//             episode,
//             style: const TextStyle(color: Colors.white, fontSize: 12),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCategoryRow() {
//     return SizedBox(
//       height: 120,
//       child: ListView.separated(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         scrollDirection: Axis.horizontal,
//         itemCount: 6,
//         separatorBuilder: (_, __) => const SizedBox(width: 16),
//         itemBuilder: (context, index) => _buildCategoryItem(index),
//       ),
//     );
//   }

//   Widget _buildCategoryItem(int index) {
//     final List<Map<String, dynamic>> categories = [
//       {'name': 'SAC', 'image': 'assets/clublogo/SAC.png', 'color': Colors.grey},
//       {'name': 'LEO', 'image': 'assets/clublogo/LEO.png', 'color': Colors.grey},
//       {'name': 'GDG', 'image': 'assets/clublogo/GDG.png', 'color': Colors.grey},
//       {'name': 'ROT', 'image': 'assets/clublogo/ROT.png', 'color': Colors.grey},
//       {'name': 'NSS', 'image': 'assets/clublogo/NSS.png', 'color': Colors.grey},
//       {'name': 'RED', 'image': 'assets/clublogo/RED.png', 'color': Colors.grey},
//     ];

//     return GestureDetector(
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => MyEPage()),
//       ),
//       child: Column(
//         children: [
//           Container(
//             width: 70,
//             height: 70,
//             decoration: BoxDecoration(
//               color: categories[index]['color'].withOpacity(0.1),
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: categories[index]['color'].withOpacity(0.3),
//                 width: 2,
//               ),
//             ),
//             child: ClipOval(
//               child: Image.asset(
//                 categories[index]['image'],
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 height: double.infinity,
//                 errorBuilder: (context, error, stackTrace) => Icon(
//                   Icons.error,
//                   color: Colors.red,
//                   size: 30,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             categories[index]['name'],
//             style: const TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCarouselSection(Size size) {
//     return Column(
//       children: [
//         CarouselSlider(
//           items: carouselItems.map((item) => _buildCarouselItem(item, size)).toList(),
//           options: CarouselOptions(
//             height: size.height * 0.25,
//             autoPlay: true,
//             enlargeCenterPage: true,
//             viewportFraction: 0.8,
//             onPageChanged: (index, reason) {
//               setState(() => _currentCarouselIndex = index);
//             },
//           ),
//           carouselController: _carouselController,
//         ),
//         const SizedBox(height: 12),
//         _buildCarouselIndicators(),
//       ],
//     );
//   }

//   Widget _buildCarouselItem(String imagePath, Size size) {
//     return Container(
//       width: size.width,
//       margin: const EdgeInsets.symmetric(horizontal: 4),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         image: DecorationImage(
//           image: AssetImage(imagePath),
//           fit: BoxFit.cover,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           gradient: LinearGradient(
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//             colors: [
//               Colors.black.withOpacity(0.6),
//               Colors.transparent,
//             ],
//           ),
//         ),
//         child: Align(
//           alignment: Alignment.bottomLeft,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Club Spotlight',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 shadows: [
//                   Shadow(
//                     color: Colors.black.withOpacity(0.3),
//                     blurRadius: 4,
//                     offset: const Offset(2, 2),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCarouselIndicators() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: carouselItems.asMap().entries.map((entry) {
//         return GestureDetector(
//           onTap: () => _carouselController.jumpToPage(entry.key),
//           child: Container(
//             width: 8.0,
//             height: 8.0,
//             margin: const EdgeInsets.symmetric(horizontal: 4.0),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: _currentCarouselIndex == entry.key
//                   ? Colors.blue
//                   : Colors.grey.withOpacity(0.4),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildSectionHeader(String title, {VoidCallback? onSeeAll}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           if (onSeeAll != null)
//             TextButton(
//               onPressed: onSeeAll,
//               child: const Text('See All'),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomAppBar(ThemeData theme) {
//     return BottomAppBar(
//       shape: const CircularNotchedRectangle(),
//       notchMargin: 8,
//       child: Container(
//         height: 60,
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             IconButton(
//               icon: Icon(Iconsax.home, color: theme.colorScheme.primary),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Iconsax.message, color: Colors.grey.shade500),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Iconsax.user, color: Colors.grey.shade500),
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildNotificationBadge() {
//     return Stack(
//       children: [
//         IconButton(
//           icon: Icon(Iconsax.notification, color: Theme.of(context).colorScheme.onSurface),
//           onPressed: () {},
//         ),
//         Positioned(
//           right: 8,
//           top: 7,
//           child: Container(
//             padding: const EdgeInsets.all(2),
//             decoration: const BoxDecoration(
//               color: Colors.red,
//               shape: BoxShape.circle,
//             ),
//             constraints: const BoxConstraints(
//               minWidth: 13,
//               minHeight: 13,
//             ),
//             child: const Text(
//               '3',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildLoadingIndicator() {
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }



//   SliverAppBar _buildAppBar(ThemeData theme) {
//     return SliverAppBar(
//       floating: true,
//       snap: true,
//       backgroundColor: theme.colorScheme.surface,
//       elevation: 0,
//       title: AnimatedOpacity(
//         opacity: _fadeAnimation.value,
//         duration: const Duration(milliseconds: 500),
//         child: Text(
//           'Explore Clubs',
//           style: theme.textTheme.headlineSmall?.copyWith(
//             fontWeight: FontWeight.bold,
//             color: theme.colorScheme.onSurface,
//           ),
//         ),
//       ),
//       actions: [
//         _buildNotificationBadge(),
//       ],
//     );
//   }

//   Widget _buildCarouselSection(Size size) {
//     return Column(
//       children: [
//         CarouselSlider(
//           items: carouselItems.map((item) => _buildCarouselItem(item, size)).toList(),
//           options: CarouselOptions(
//             height: size.height * 0.25,
//             autoPlay: true,
//             enlargeCenterPage: true,
//             viewportFraction: 0.8,
//             onPageChanged: (index, reason) {
//               setState(() => _currentCarouselIndex = index);
//             },
//           ),
//           carouselController: _carouselController,
//         ),
//         const SizedBox(height: 12),
//         _buildCarouselIndicators(),
//       ],
//     );
//   }

//   Widget _buildCarouselItem(String imagePath, Size size) {
//     return Container(
//       width: size.width,
//       margin: const EdgeInsets.symmetric(horizontal: 4),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         image: DecorationImage(
//           image: AssetImage(imagePath),
//           fit: BoxFit.cover,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           gradient: LinearGradient(
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//             colors: [
//               Colors.black.withOpacity(0.6),
//               Colors.transparent,
//             ],
//           ),
//         ),
//         child: Align(
//           alignment: Alignment.bottomLeft,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Club Spotlight',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 shadows: [
//                   Shadow(
//                     color: Colors.black.withOpacity(0.3),
//                     blurRadius: 4,
//                     offset: const Offset(2, 2),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

// Widget _buildBottomAppBar(ThemeData theme) {
//     return BottomAppBar(
//       shape: const CircularNotchedRectangle(),
//       notchMargin: 8,
//       child: Container(
//         height: 60,
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             IconButton(
//               icon: Icon(Iconsax.home, color: theme.colorScheme.primary),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Iconsax.message, color: Colors.grey.shade500),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Iconsax.user, color: Colors.grey.shade500),
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
