import 'package:flutter/material.dart';

void main() => runApp(const DexPesApp());

const gold = Color(0xFFD4AF37);
const bg = Color(0xFF090909);

class DexPesApp extends StatelessWidget {
  const DexPesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DEX PES',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: gold,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: bg,
          foregroundColor: gold,
          centerTitle: true,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tab = 0;

  final pages = const [
    HomeTab(),
    SimpleTab(title: 'التشكيلات', subtitle: 'قريباً: تشكيلات وخطط eFootball'),
    SimpleTab(title: 'اللاعبون', subtitle: 'قريباً: قاعدة بيانات اللاعبين وتقييماتهم'),
    SimpleTab(title: 'الأخبار', subtitle: 'قريباً: آخر أخبار اللعبة والتحديثات'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DEX PES', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2)),
      ),
      body: pages[tab],
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF151515),
        indicatorColor: gold.withOpacity(.18),
        selectedIndex: tab,
        onDestinationSelected: (v) => setState(() => tab = v),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'الرئيسية'),
          NavigationDestination(icon: Icon(Icons.sports_soccer), label: 'التشكيلات'),
          NavigationDestination(icon: Icon(Icons.groups_outlined), label: 'اللاعبون'),
          NavigationDestination(icon: Icon(Icons.newspaper), label: 'الأخبار'),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(
              colors: [Color(0xFF30250A), Color(0xFF111111)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: gold.withOpacity(.55)),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('أهلاً بك في', style: TextStyle(color: Colors.white70, fontSize: 16)),
              SizedBox(height: 6),
              Text('DEX PES', style: TextStyle(color: gold, fontSize: 32, fontWeight: FontWeight.w900)),
              SizedBox(height: 8),
              Text('كل ما تحتاجه لعالم eFootball بمكان واحد', style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
        const SizedBox(height: 22),
        const Text('الأقسام', style: TextStyle(color: gold, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        const FeatureCard(icon: Icons.sports_soccer, title: 'التشكيلات', subtitle: 'خطط وتكتيكات للفرق'),
        const FeatureCard(icon: Icons.manage_search, title: 'قاعدة اللاعبين', subtitle: 'ابحث عن اللاعبين وتعرّف على تقييماتهم'),
        const FeatureCard(icon: Icons.auto_awesome, title: 'محاكي البكجات', subtitle: 'تجربة افتراضية للترفيه فقط'),
        const FeatureCard(icon: Icons.campaign_outlined, title: 'الأخبار', subtitle: 'تحديثات وأخبار eFootball'),
      ],
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const FeatureCard({super.key, required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF171717),
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: gold.withOpacity(.25)),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: gold.withOpacity(.15),
          child: Icon(icon, color: gold),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right, color: gold),
      ),
    );
  }
}

class SimpleTab extends StatelessWidget {
  final String title;
  final String subtitle;
  const SimpleTab({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.construction, color: gold, size: 52),
            const SizedBox(height: 14),
            Text(title, style: const TextStyle(color: gold, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}
