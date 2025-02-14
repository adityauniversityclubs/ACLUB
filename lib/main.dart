import 'package:aclub/views/auth/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Import your persistent navigation wrapper

void main() async {
  // WidgetsFlutterBinding.ensureInitialized(); // Ensure binding before Firebase initialization
  // await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ACLUB',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(), // llefteftUse the persistent navigation wrapper
        );
      },
    );
  }
}








// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// /// The root widget of the app.
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Event Data Fetcher',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Event Data Fetcher'),
//     );
//   }
// }

// /// The home page with a TabBar for each endpoint.
// class MyHomePage extends StatefulWidget {
//   final String title;
//   MyHomePage({Key? key, required this.title}) : super(key: key);
  
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
  
//   // List of tabs with titles and corresponding URLs.
//   final List<Map<String, String>> tabs = [
//     {"title": "All Past", "url": "https://aclub.onrender.com/events/all-past-events"},
//     {"title": "All Upcoming", "url": "https://aclub.onrender.com/events/all-upcoming-events"},
//     {"title": "All Ongoing", "url": "https://aclub.onrender.com/events/all-ongoing-events"},
//     {"title": "Upcoming (GDG)", "url": "https://aclub.onrender.com/events/upcoming-events?clubId=GDG"},
//     {"title": "Ongoing (GDG)", "url": "https://aclub.onrender.com/events/ongoing-events?clubId=GDG"},
//     {"title": "Past (GDG)", "url": "https://aclub.onrender.com/events/past-events?clubId=GDG"},
//   ];
  
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: tabs.length, vsync: this);
//   }
  
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         bottom: TabBar(
//           controller: _tabController,
//           isScrollable: true,
//           tabs: tabs.map((tab) => Tab(text: tab['title'])).toList(),
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: tabs.map((tab) => DataTab(url: tab['url']!)).toList(),
//       ),
//     );
//   }
// }

// /// Widget that fetches and displays data from a given URL.
// class DataTab extends StatelessWidget {
//   final String url;
  
//   DataTab({required this.url});
  
//   /// Fetches data from the API.
//   Future<dynamic> fetchData() async {
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       // Decode the JSON data
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load data from $url');
//     }
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: fetchData(),
//       builder: (context, snapshot) {
//         // While waiting for data, show a loading spinner.
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//         // If an error occurred, display it.
//         else if (snapshot.hasError) {
//           return Center(child: Text("Error: ${snapshot.error}"));
//         }
//         // Once data is fetched, display it.
//         else if (snapshot.hasData) {
//           final data = snapshot.data;
//           // Check if the data is a List (as expected)
//           if (data is List) {
//             if (data.isEmpty) {
//               return Center(child: Text("No events found."));
//             }
//             return ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 final item = data[index];
//                 return Card(
//                   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   child: ListTile(
//                     title: Text(item['name'] ?? 'No Name'),
//                     subtitle: Text(item['description'] ?? 'No Description'),
//                   ),
//                 );
//               },
//             );
//           } else {
//             // If data is not a list, show its string representation.
//             return Center(child: Text("Unexpected data format: ${data.toString()}"));
//           }
//         } else {
//           return Center(child: Text("No data available."));
//         }
//       },
//     );
//   }
// }





















