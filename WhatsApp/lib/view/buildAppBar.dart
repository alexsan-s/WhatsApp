import 'package:flutter/material.dart';
import 'package:WhatsApp/model/colors.dart';

class BuildAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool objIsLight;
  BuildAppBar({this.objIsLight});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  _BuildAppBarState createState() => _BuildAppBarState();
}

class _BuildAppBarState extends State<BuildAppBar>
    with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.objIsLight ? lightGreen : darkGreen,
      title: Text(
        "WhatsApp",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: widget.objIsLight ? lightFont : darkFont,
        ),
      ),
      bottom: TabBar(
        isScrollable: false,
        controller: _tabController,
        indicatorColor: widget.objIsLight ? lightFontEnabled : darkFontEnabled,
        labelColor: widget.objIsLight ? lightFontEnabled : darkFontEnabled,
        unselectedLabelColor: widget.objIsLight ? lightFont : darkFont,
        tabs: [
          Icon(
            Icons.camera_alt_outlined,
          ),
          Tab(
            text: "CHATS",
          ),
          Tab(
            text: "STATUS",
          ),
          Tab(
            text: "CALLS",
          ),
        ],
      ),
      actions: [
        Icon(
          Icons.search_outlined,
          color: widget.objIsLight ? lightFontEnabled : darkFont,
        ),
        PopupMenuButton(
            onSelected: (value) {
              value == 1
                  ? Navigator.pushNamed(
                      context,
                      '/settings',
                      arguments: {'isLight': widget.objIsLight},
                    )
                  : Navigator.pushNamed(context, '/settings');
            },
            itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Text('New Group'),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text('Settings'),
                  )
                ]),
      ],
    );
  }
}
