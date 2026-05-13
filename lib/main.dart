import 'package:flutter/material.dart';

void main() {
  runApp(const MkAbSportApp());
}

class MkAbSportApp extends StatelessWidget {
  const MkAbSportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MkAbSport',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
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
      SportCategory(name: 'Football', icon: Icons.sports_soccer, color: Colors.green),
      SportCategory(name: 'Basketball', icon: Icons.sports_basketball, color: Colors.orange),
      SportCategory(name: 'Tennis', icon: Icons.sports_tennis, color: Colors.yellow.shade700),
      SportCategory(name: 'Natation', icon: Icons.pool, color: Colors.blue),
      SportCategory(name: 'Athlétisme', icon: Icons.directions_run, color: Colors.red),
      SportCategory(name: 'Cyclisme', icon: Icons.directions_bike, color: Colors.purple),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('MkAbSport - Promotion du Sport'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            height: 100,
            margin: const EdgeInsets.only(bottom: 16),
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
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Plus d\'infos sur le ${category.name} bientôt !')),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(category.icon, size: 48, color: category.color),
            const SizedBox(height: 8),
            Text(
              category.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(date, style: TextStyle(color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }
}
