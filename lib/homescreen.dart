import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.green, // Change this to your desired color
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.grass_rounded),
            onPressed: () {
              Get.changeTheme(ThemeData.dark());
            },
          ),
          IconButton(
            icon: Icon(Icons.light),
            onPressed: () {
              Get.changeTheme(ThemeData.light());
            },
          ),
        ],
        title: Text('MathsGo'),
      ),
      body: VideoList(),
    );
  }
}

class VideoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: videoData.length,
      itemBuilder: (context, index) {
        return VideoCard(video: videoData[index]);
      },
    );
  }
}

class VideoCard extends StatelessWidget {
  final Video video;

  VideoCard({required this.video});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(VideoPage(video: video));
      },
      child: Container(

        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.yellowAccent,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assests/mathsgo.jpg', // Replace with the actual path to your local image
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),

            ),
            SizedBox(height: 10.0),
            Text(
              video.title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              video.description,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),


          ],

        ),

      ),

    );
  }
}

class VideoPage extends StatelessWidget {
  final Video video;

  VideoPage({required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(video.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  // child: Image.network(
                  //   // video.thumbnailUrl,
                  //   // fit: BoxFit.cover,
                  // ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              video.title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              video.description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {

              },
              child: Text('Play Video'),
            ),
          ],
        ),
      ),
    );
  }
}

class Video {
  final String title;
  final String description;
  final String thumbnailUrl;

  Video({
    required this.title,
    required this.description,
    required this.thumbnailUrl,
  });
}

List<Video> videoData = [
  Video(
    title: 'Mathematics Basics',
    description: 'Learn the fundamentals of mathematics.',
    thumbnailUrl: 'https://youtu.be/wtHBsvj2QKA?si=JEgd-j3TDY9kBMhs',
  ),
  Video(
    title: 'History of Science',
    description: 'Explore the history of scientific discoveries.',
    thumbnailUrl: 'https://example.com/history_thumbnail.jpg',
  ),
  // Add more videos to the list
];



