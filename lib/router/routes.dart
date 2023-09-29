import 'package:flutter/material.dart';
import 'package:renstatefrontend/ui-mesagge/messages_view.dart';

var customRoutes = <String, WidgetBuilder>{
  MessagesView.id: (_) => const MessagesView(),
};
