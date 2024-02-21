// loggedOut
// loggedIn

import 'package:flutter/material.dart';
import 'package:reddit_clone_master/features/auth/view/login_screen.dart';
import 'package:reddit_clone_master/features/community/view/add_mods_screen.dart';
import 'package:reddit_clone_master/features/community/view/community_screen.dart';
import 'package:reddit_clone_master/features/community/view/create_community_screen.dart';
import 'package:reddit_clone_master/features/community/view/edit_community_screen.dart';
import 'package:reddit_clone_master/features/community/view/mod_tools_screen.dart';
import 'package:reddit_clone_master/features/home/view/home_screen.dart';
import 'package:reddit_clone_master/features/post/views/add_post_type_screen.dart';
import 'package:reddit_clone_master/features/post/views/comment_screen.dart';
import 'package:reddit_clone_master/features/user_profile/view/edit_profile_screen.dart';
import 'package:reddit_clone_master/features/user_profile/view/user_profile_screen.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
});

final loggedInRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: HomeScreen()),
    '/create-community': (_) =>
        const MaterialPage(child: CreateCommunityScreen()),
    '/r/:name': (route) => MaterialPage(
          child: CommunityScreen(
            name: route.pathParameters['name']!,
          ),
        ),
    '/mod-tools/:name': (routeData) => MaterialPage(
          child: ModToolsScreen(
            name: routeData.pathParameters['name']!,
          ),
        ),
    '/edit-community/:name': (routeData) => MaterialPage(
          child: EditCommunityScreen(
            name: routeData.pathParameters['name']!,
          ),
        ),
    '/add-mods/:name': (routeData) => MaterialPage(
          child: AddModsScreen(
            name: routeData.pathParameters['name']!,
          ),
        ),
    '/u/:uid': (routeData) => MaterialPage(
          child: UserProfileScreen(
            uid: routeData.pathParameters['uid']!,
          ),
        ),
    '/edit-profile/:uid': (routeData) => MaterialPage(
          child: EditProfileScreen(
            uid: routeData.pathParameters['uid']!,
          ),
        ),
    '/add-post/:type': (routeData) => MaterialPage(
          child: AddPostTypeScreen(
            type: routeData.pathParameters['type']!,
          ),
        ),
    '/post/:postId/comments': (route) => MaterialPage(
          child: CommentScreen(
            postId: route.pathParameters['postId']!,
          ),
        ),
    // '/add-post': (routeData) => const MaterialPage(
    //       child: AddPostScreen(),
    //     ),
  },
);
