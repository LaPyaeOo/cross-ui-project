import 'package:flutter/material.dart';

// Remove the destination.dart import, it's not required
import 'models/data.dart' as data;
import 'models/models.dart';
import 'widgets/disappearing_bottom_navigation_bar.dart';  // Add import
import 'widgets/disappearing_navigation_rail.dart';        // Add import
import 'widgets/email_list_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Feed(currentUser: data.user_0),
    );
  }
}

class Feed extends StatefulWidget {
  const Feed({super.key, required this.currentUser});

  final User currentUser;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  late final _colorScheme = Theme.of(context).colorScheme;
  late final _backgroundColor = Color.alphaBlend(
    _colorScheme.primary.withAlpha(36),
    _colorScheme.surface,
  );

  int selectedIndex = 0;
  // Add from here...
  bool wideScreen = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final double width = MediaQuery.of(context).size.width;
    wideScreen = width > 600;
  }
  // ... to here.

  @override
  Widget build(BuildContext context) {
    // Modify from here...
    return Scaffold(
      body: Row(
        children: [
          if (wideScreen)
            DisappearingNavigationRail(
              selectedIndex: selectedIndex,
              backgroundColor: _backgroundColor,
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          Expanded(
            child: Container(
              color: _backgroundColor,
              child: EmailListView(
                selectedIndex: selectedIndex,
                onSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                currentUser: widget.currentUser,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: wideScreen
          ? null
          : FloatingActionButton(
        backgroundColor: _colorScheme.tertiaryContainer,
        foregroundColor: _colorScheme.onTertiaryContainer,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: wideScreen
          ? null
          : DisappearingBottomNavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
    // ... to here.
  }
}