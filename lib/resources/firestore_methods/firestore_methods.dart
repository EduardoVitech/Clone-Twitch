import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:twitch_clone/models/livestream/livestream.dart';
import 'package:twitch_clone/providers/user_provider/user_provider.dart';
import 'package:twitch_clone/resources/storage_methods/storage_methods.dart';
import 'package:twitch_clone/utils/utils/utils.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final StorageMethods _storageMethods = StorageMethods();

  Future<String> startLiveStream(
      BuildContext context, String title, Uint8List? image) async {
    final user = Provider.of<UserProvider>(context, listen: false);
    String channelId = '';
    try {
      if (title.isNotEmpty && image != null) {
        if (!(await _firestore
                .collection('livestream')
                .doc(user.user.uid)
                .get())
            .exists) {
          String thumbnailUrl = await _storageMethods.uploadImageToStorange(
            'livestream-thumbnails',
            image,
            user.user.uid,
          );
          channelId = '${user.user.uid}${user.user.username}';

          LiveStream liveStream = LiveStream(
            title: title,
            image: thumbnailUrl,
            uid: user.user.uid,
            username: user.user.username,
            viewers: 0,
            channelId: channelId,
            startedAt: DateTime.now(),
          );

          _firestore
              .collection('livestream')
              .doc(channelId)
              .set(liveStream.toMap());
        } else {
          showSnackBar(context, 'Two Livestream on');
        }
      } else {
        showSnackBar(context, 'Please enter all fields');
      }
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
    return channelId;
  }
}