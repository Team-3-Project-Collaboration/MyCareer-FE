import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CareerHubScreen extends StatelessWidget {
  const CareerHubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    'CareerHub',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Apa yang anda pikirkan?',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(Icons.send, color: Colors.blue),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              tabs: [Tab(text: 'Threads'), Tab(text: 'Balasan')],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1: Threads
                  ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    children: [
                      _ThreadItem(
                        username: 'Arkav',
                        timeAgo: '33 min',
                        content:
                            'There are so many great little design touches in threads. Really Great',
                        replyUsername: 'Natha',
                        replyContent:
                            'you can start with @rourkey and @brainsw but theres more folks',
                        replies: 26,
                        likes: 112,
                      ),
                      SizedBox(height: 20.h),
                      _ThreadItem(
                        username: 'Dinda',
                        timeAgo: '7 j',
                        content:
                            'There are so many great little design touches in threads. Really Great',
                        replies: 26,
                        likes: 112,
                      ),
                    ],
                  ),

                  // Tab 2: Balasan
                  ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    children: [
                      _ThreadItem(
                        username: 'Budi',
                        timeAgo: '1 h',
                        content: 'Balasan untuk topik menarik!',
                        replies: 5,
                        likes: 20,
                      ),
                      SizedBox(height: 20.h),
                      _ThreadItem(
                        username: 'Siti',
                        timeAgo: '2 h',
                        content: 'Saya juga setuju dengan topik ini!',
                        replies: 2,
                        likes: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThreadItem extends StatelessWidget {
  final String username;
  final String timeAgo;
  final String content;
  final String? replyUsername;
  final String? replyContent;
  final int replies;
  final int likes;

  const _ThreadItem({
    required this.username,
    required this.timeAgo,
    required this.content,
    this.replyUsername,
    this.replyContent,
    required this.replies,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(child: Icon(Icons.person)),
            SizedBox(width: 8.w),
            Text(
              username,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            Spacer(),
            Text(timeAgo, style: TextStyle(color: Colors.grey)),
          ],
        ),
        SizedBox(height: 8.h),
        Text(content),
        if (replyUsername != null && replyContent != null) ...[
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                CircleAvatar(child: Icon(Icons.person)),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        replyUsername!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(replyContent!),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        SizedBox(height: 8.h),
        Row(
          children: [
            Icon(Icons.favorite_border),
            SizedBox(width: 8.w),
            Icon(Icons.repeat),
            SizedBox(width: 8.w),
            Text('$replies replies • $likes likes'),
          ],
        ),
      ],
    );
  }
}
