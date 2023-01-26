import 'dart:io';

import 'package:flutter/material.dart';
import 'package:netwolf/netwolf.dart';
import 'package:netwolf/src/widgets/widgets.dart';

class NetwolfAppBar extends StatelessWidget with PreferredSizeWidget {
  const NetwolfAppBar({
    super.key,
    required this.title,
    this.bottom,
    this.actions,
  });

  final String title;
  final PreferredSizeWidget? bottom;
  final List<IconButton>? actions;

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: _buildLeading(context),
      title: _buildTitle(context),
      centerTitle: true,
      actions: _buildActions(context),
      bottom: bottom,
    );
  }

  Widget? _buildLeading(BuildContext context) {
    if (!NetwolfRouter.of(context).canPop()) return null;

    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: IconButton(
        icon: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
        onPressed: NetwolfRouter.of(context).pop,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(title);
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      ...actions ?? [],
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: NetwolfController.instance.hide,
      ),
      const SizedBox(width: 12),
    ];
  }
}