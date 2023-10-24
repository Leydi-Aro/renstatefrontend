import 'package:flutter/material.dart';
import 'package:renstatefrontend/properties-searching/ui/all_results.dart';
import 'package:renstatefrontend/properties-searching/ui/search_page.dart';
import 'package:renstatefrontend/properties-searching/ui/see_post.dart';
import 'package:renstatefrontend/ui-initial-section/init_view.dart';
import 'package:renstatefrontend/ui-mesagge/receivedMessages.dart';
import 'package:renstatefrontend/ui-profile/profile_view.dart';
import 'package:renstatefrontend/ui-initial-section/welcome_view.dart';
import '../ui-initial-section/login_view.dart';
import '../ui-initial-section/register_view.dart';

var customRoutes = <String, WidgetBuilder>{
  LoginView.id: (_) => const LoginView(),
  RegisterView.id: (_) => const RegisterView(),
  InitView.id: (_) => const InitView(),
  WelcomeView.id: (_) => const WelcomeView(),
  ProfileView.id: (_) => const ProfileView(),
  ReceivedMessages.id: (_) => const ReceivedMessages(),
  AllResults.id: (_) => const AllResults(),
  SearchPage.id: (_) => const SearchPage(),
  SeePost.id: (_) => const SeePost(),
};
