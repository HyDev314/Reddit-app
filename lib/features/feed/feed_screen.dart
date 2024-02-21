import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone_master/core/common/error.dart';
import 'package:reddit_clone_master/core/common/loader.dart';
import 'package:reddit_clone_master/core/common/post_card.dart';
import 'package:reddit_clone_master/features/community/controller/community_controller.dart';
import 'package:reddit_clone_master/features/post/controller/post_controller.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userCommunitiesProvider).when(
          data: (data) => ref.watch(userPostsProvider(data)).when(
                data: (data) {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final post = data[index];
                      return PostCard(post: post);
                    },
                  );
                },
                error: (error, stackTrace) {
                  print(error);
                  return ErrorScreen(
                    errorText: error.toString(),
                  );
                },
                loading: () => const LoaderScreen(),
              ),
          error: (error, stackTrace) => ErrorScreen(
            errorText: error.toString(),
          ),
          loading: () => const LoaderScreen(),
        );
  }
}
