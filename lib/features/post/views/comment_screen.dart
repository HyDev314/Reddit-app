import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone_master/core/common/error.dart';
import 'package:reddit_clone_master/core/common/loader.dart';
import 'package:reddit_clone_master/core/common/post_card.dart';
import 'package:reddit_clone_master/features/community/controller/community_controller.dart';
import 'package:reddit_clone_master/features/post/controller/post_controller.dart';
import 'package:reddit_clone_master/features/post/models/post_model.dart';
import 'package:reddit_clone_master/features/post/views/comment_card.dart';

class CommentScreen extends ConsumerStatefulWidget {
  final String postId;
  const CommentScreen({
    super.key,
    required this.postId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommentScreenState();
}

class _CommentScreenState extends ConsumerState<CommentScreen> {
  final commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    commentController.dispose();
  }

  void addComment(Post post) {
    ref.read(postControllerProvider.notifier).addComment(
          context: context,
          text: commentController.text.trim(),
          post: post,
        );
    setState(() {
      commentController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ref.watch(getPostByIdProvider(widget.postId)).when(
            data: (data) {
              return Column(
                children: [
                  PostCard(post: data),
                  TextField(
                    onSubmitted: (val) => addComment(data),
                    controller: commentController,
                    decoration: const InputDecoration(
                      hintText: 'Comment',
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                  ref.watch(getPostCommentsProvider(widget.postId)).when(
                        data: (data) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                final comment = data[index];
                                return CommentCard(comment: comment);
                              },
                            ),
                          );
                        },
                        error: (error, stackTrace) {
                          return ErrorScreen(errorText: error.toString());
                        },
                        loading: () => const LoaderScreen(),
                      ),
                ],
              );
            },
            error: (error, stackTrace) => ErrorScreen(
              errorText: error.toString(),
            ),
            loading: () => const LoaderScreen(),
          ),
    );
  }
}