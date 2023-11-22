import 'package:flutter/material.dart';
import 'package:renstatefrontend/properties-searching/ui/search_page.dart';
import 'package:renstatefrontend/ui-initial-section/init_view.dart';
import 'package:renstatefrontend/ui-mesagge/receivedMessages.dart';
import 'package:renstatefrontend/ui-profile/profile_view.dart';
import 'package:renstatefrontend/ui-initial-section/welcome_view.dart';
import 'package:renstatefrontend/properties-searching/ui/post-ui/YourPosts.dart';
import '../ui-initial-section/login_view.dart';
import '../ui-initial-section/register_view.dart';
import 'package:renstatefrontend/see-your-clients/ui/see_clients.dart';
import 'package:renstatefrontend/external-service/maps/maps.dart';

var customRoutes = <String, WidgetBuilder>{
  LoginView.id: (_) => LoginView(),
  RegisterView.id: (_) => const RegisterView(),
  InitView.id: (_) => const InitView(),
  WelcomeView.id: (_) => const WelcomeView(),
  ProfileView.id: (_) => const ProfileView(),
  ReceivedMessages.id: (_) => const ReceivedMessages(),
  SearchPage.id: (_) => const SearchPage(),
  YourPosts.id: (_) => const YourPosts(),
  ClientsView.id: (_) => const ClientsView(),
  GoogleMaps.id:(_)=>const GoogleMaps(),
};
