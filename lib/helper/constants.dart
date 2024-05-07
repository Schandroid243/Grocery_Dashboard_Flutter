import 'package:flutter/material.dart';

var myDefaultBackground = Colors.grey[300];
var myAppBar = AppBar(
  iconTheme: IconThemeData(color: Colors.grey[300]),
  backgroundColor: Colors.grey[900],
);

var myDrawer = Builder(builder: (context) {
  return Drawer(
    backgroundColor: Colors.grey[200],
    elevation: 0,
    child: Column(
      children: [
        DrawerHeader(
          child: SizedBox(
            width: 130,
            height: 60,
            child: Image.asset("assets/images/supermarket_logo.jpeg"),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          hoverColor: const Color.fromARGB(166, 201, 198, 198),
          onTap: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/", (route) => false);
          },
          child: ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.grey[900],
            ),
            title: const Text('Acceuil', style: TextStyle(color: Colors.black)),
          ),
        ),
        InkWell(
          hoverColor: const Color.fromARGB(166, 201, 198, 198),
          onTap: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/list-article", (route) => false);
          },
          child: ListTile(
            leading: Icon(Icons.article, color: Colors.grey[900]),
            title:
                const Text('Articles', style: TextStyle(color: Colors.black)),
          ),
        ),
        InkWell(
          hoverColor: const Color.fromARGB(166, 201, 198, 198),
          onTap: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/list-category", (route) => false);
          },
          child: ListTile(
            leading: Icon(Icons.category, color: Colors.grey[900]),
            title:
                const Text('Categories', style: TextStyle(color: Colors.black)),
          ),
        ),
        InkWell(
          hoverColor: const Color.fromARGB(166, 201, 198, 198),
          onTap: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/list-slider", (route) => false);
          },
          child: ListTile(
            leading: Icon(Icons.publish, color: Colors.grey[900]),
            title: const Text('Sliders', style: TextStyle(color: Colors.black)),
          ),
        ),
        InkWell(
          hoverColor: const Color.fromARGB(166, 201, 198, 198),
          onTap: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/list-user", (route) => false);
          },
          child: ListTile(
            leading: Icon(Icons.people, color: Colors.grey[900]),
            title: const Text('Utilisateurs',
                style: TextStyle(color: Colors.black)),
          ),
        ),
        InkWell(
          hoverColor: const Color.fromARGB(166, 201, 198, 198),
          onTap: () {},
          child: ListTile(
            leading: Icon(Icons.settings, color: Colors.grey[900]),
            title: const Text('Configuration',
                style: TextStyle(color: Colors.black)),
          ),
        ),
        InkWell(
          hoverColor: const Color.fromARGB(166, 201, 198, 198),
          onTap: () {},
          child: ListTile(
            leading: Icon(Icons.logout, color: Colors.grey[900]),
            title: const Text('Déconnexion',
                style: TextStyle(color: Colors.black)),
          ),
        ),
      ],
    ),
  );
});
