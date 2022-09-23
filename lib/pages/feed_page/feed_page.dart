import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twitch_clone/models/livestream/livestream.dart';
import 'package:twitch_clone/pages/broadcast_page/broadcast_page.dart';
import 'package:twitch_clone/resources/firestore_methods/firestore_methods.dart';
import '../../widgets/loading_indicator/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(
          top: 10,
        ),
        child: Column(
          children: [
            const Text(
              'Live User',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            StreamBuilder<dynamic>(
              stream: FirebaseFirestore.instance
                  .collection('livestream')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingIndicator();
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      LiveStream post =
                          LiveStream.fromMap(snapshot.data.docs[index].data());
                      return InkWell(
                        onTap: () async {
                          await FirestoreMethods()
                              .updateViewCount(post.channelId, true);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => BroadcastPage(
                                isBroadcaster: false,
                                channelId: post.channelId,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: size.height * 0.14,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Image.network(post.image),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    post.username,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    post.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('${post.viewers} watching'),
                                  Text(
                                    'Started ${timeago.format(post.startedAt.toDate())}',
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_vert,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
