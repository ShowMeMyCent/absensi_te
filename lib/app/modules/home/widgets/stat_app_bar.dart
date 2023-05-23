import 'package:flutter/material.dart';

class StatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StatAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 5,
      elevation: 0,
      bottom: TabBar(
        tabs: <Widget>[
          Tab(
            child: Text(
              'Statistik Absensi',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
            ),
          ),
          Tab(
            child: Text(
              'Riwayat Absensi',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
