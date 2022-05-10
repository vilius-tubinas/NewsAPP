import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final Function refreshHeadlines;
  NavBar(this.refreshHeadlines, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Choose a category, Visma Geek!'),
            accountEmail: Text('(Made using newsAPI)'),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('http://mural.uv.es/tola/f.jpg')),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.business),
            title: const Text('Business'),
            onTap: () async =>
                {await refreshHeadlines("business"), Navigator.pop(context)},
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Entertainment'),
            onTap: () async => {
              await refreshHeadlines("entertainment"),
              Navigator.pop(context)
            },
          ),
          ListTile(
            leading: const Icon(Icons.health_and_safety),
            title: const Text('Health'),
            onTap: () async =>
                {await refreshHeadlines("health"), Navigator.pop(context)},
          ),
          ListTile(
            leading: const Icon(Icons.science),
            title: const Text('Science'),
            onTap: () async =>
                {await refreshHeadlines("science"), Navigator.pop(context)},
          ),
          ListTile(
            leading: const Icon(Icons.sports),
            title: const Text('Sports'),
            onTap: () async =>
                {await refreshHeadlines("sports"), Navigator.pop(context)},
          ),
          ListTile(
            leading: const Icon(Icons.computer),
            title: const Text('Technology'),
            onTap: () async =>
                {await refreshHeadlines("technology"), Navigator.pop(context)},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('View all'),
            onTap: () async =>
                {await refreshHeadlines(null), Navigator.pop(context)},
          ),
        ],
      ),
    );
  }
}
