import 'package:flutter/material.dart';

void main() {
  runApp(const MkAbSportApp());
}

class MkAbSportApp extends StatelessWidget {
  const MkAbSportApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Brand Colors from logo
    const Color brandDarkBlue = Color(0xFF001229);
    const Color brandGold = Color(0xFFFDB913);

    return MaterialApp(
      title: 'MkAbSport',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: brandGold,
          primary: brandGold,
          onPrimary: brandDarkBlue,
          surface: brandDarkBlue,
          onSurface: Colors.white,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: brandDarkBlue,
        useMaterial3: true,
      ),
      home: const SportsHomePage(),
    );
  }
}

class SportsHomePage extends StatelessWidget {
  const SportsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SportCategory> categories = [
      SportCategory(name: 'Football', icon: Icons.sports_soccer, color: Colors.greenAccent),
      SportCategory(name: 'Basketball', icon: Icons.sports_basketball, color: Colors.orangeAccent),
      SportCategory(name: 'Tennis', icon: Icons.sports_tennis, color: Colors.yellowAccent),
      SportCategory(name: 'Natation', icon: Icons.pool, color: Colors.blueAccent),
      SportCategory(name: 'Athlétisme', icon: Icons.directions_run, color: Colors.redAccent),
      SportCategory(name: 'Cyclisme', icon: Icons.directions_bike, color: Colors.purpleAccent),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MKAB SPORTS',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Joue, gère, réussis',
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Découvrez nos disciplines',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return SportCard(category: category);
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Événements à venir',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 110,
            margin: const EdgeInsets.only(bottom: 24),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                EventCard(name: 'Tournoi de Football local', date: '15 Juin'),
                EventCard(name: 'Marathon de la ville', date: '22 Juin'),
                EventCard(name: 'Gala de Natation', date: '5 Juillet'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SportCategory {
  final String name;
  final IconData icon;
  final Color color;

  SportCategory({required this.name, required this.icon, required this.color});
}

class SportCard extends StatelessWidget {
  final SportCategory category;

  const SportCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.white.withOpacity(0.1)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Plus d\'infos sur le ${category.name} bientôt !'),
              backgroundColor: Theme.of(context).colorScheme.primary,
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: category.color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(category.icon, size: 40, color: category.color),
            ),
            const SizedBox(height: 12),
            Text(
              category.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String name;
  final String date;

  const EventCard({super.key, required this.name, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.05),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 220,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 14, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  date,
                  style: TextStyle(color: Colors.white.withAlpha(180), fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
