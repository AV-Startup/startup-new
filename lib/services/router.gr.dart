// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/Editpost/editprofileview.dart';
import '../ui/Home/home_view.dart';
import '../ui/Login/login_view.dart';
import '../ui/Sign_up/sign_up_view.dart';
import '../ui/Startview/splash.dart';
import '../ui/cretepost/crestepostview.dart';
import '../ui/profile/profileview.dart';

class Routes {
  static const String signUpView = '/sign-up-view';
  static const String createPost = '/create-post';
  static const String loginView = '/login-view';
  static const String profileView = '/profile-view';
  static const String editPostView = '/edit-post-view';
  static const String home = '/Home';
  static const String splash = '/';
  static const all = <String>{
    signUpView,
    createPost,
    loginView,
    profileView,
    editPostView,
    home,
    splash,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.createPost, page: CreatePost),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.editPostView, page: EditPostView),
    RouteDef(Routes.home, page: Home),
    RouteDef(Routes.splash, page: Splash),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpView(),
        settings: data,
      );
    },
    CreatePost: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreatePost(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileView(),
        settings: data,
      );
    },
    EditPostView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditPostView(),
        settings: data,
      );
    },
    Home: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Home(),
        settings: data,
      );
    },
    Splash: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Splash(),
        settings: data,
      );
    },
  };
}
