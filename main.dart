\
import 'package:flutter/material.dart';

void main() => runApp(const DexPesApp());

const gold = Color(0xFFD4AF37);
const bg = Color(0xFF0B0B0D);
const panel = Color(0xFF171719);

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
        colorScheme: const ColorScheme.dark(
          primary: gold,
          secondary: gold,
          surface: panel,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: MainShell(),
      ),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;

  final pages = const [
    HomePage(),
    FormationsPage(),
    PlayersPage(),
    NewsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bg,
        titleSpacing: 18,
        title: const Row(
          children: [
            Icon(Icons.sports_soccer, color: gold, size: 25),
            SizedBox(width: 9),
            Text('DEX PES',
                style: TextStyle(
                  color: gold,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.4,
                )),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'الإشعارات',
            onPressed: () => _showInfo(context, 'الإشعارات',
                'سيتم ربط الإشعارات عند إعداد السيرفر.'),
            icon: const Icon(Icons.notifications_none, color: gold),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF111113),
        indicatorColor: gold.withOpacity(.16),
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home, color: gold),
              label: 'الرئيسية'),
          NavigationDestination(
              icon: Icon(Icons.grid_view_outlined),
              selectedIcon: Icon(Icons.grid_view, color: gold),
              label: 'التشكيلات'),
          NavigationDestination(
              icon: Icon(Icons.groups_outlined),
              selectedIcon: Icon(Icons.groups, color: gold),
              label: 'اللاعبون'),
          NavigationDestination(
              icon: Icon(Icons.newspaper_outlined),
              selectedIcon: Icon(Icons.newspaper, color: gold),
              label: 'الأخبار'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(
              colors: [Color(0xFF3B3014), Color(0xFF171719), Color(0xFF101012)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            border: Border.all(color: gold.withOpacity(.55)),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('مرحباً بك في',
                  style: TextStyle(color: Colors.white70, fontSize: 14)),
              SizedBox(height: 4),
              Text('DEX PES',
                  style: TextStyle(
                    color: gold,
                    fontSize: 31,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.8,
                  )),
              SizedBox(height: 8),
              Text('كل ما تحتاجه لعالم eFootball في مكان واحد',
                  style: TextStyle(color: Colors.white, fontSize: 13)),
              SizedBox(height: 18),
              Row(
                children: [
                  Icon(Icons.wifi, color: gold, size: 17),
                  SizedBox(width: 6),
                  Text('نسخة تجريبية - سيتم ربط البيانات أونلاين',
                      style: TextStyle(color: gold, fontSize: 11)),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 22),
        const SectionTitle('الأدوات الرئيسية'),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.35,
          children: [
            FeatureCard(
              icon: Icons.psychology_alt_outlined,
              title: 'المدرب الذكي',
              subtitle: 'اقتراح خطط وتكتيكات',
              onTap: () => _showInfo(context, 'المدرب الذكي',
                  'قريباً: تحليل تشكيلتك واقتراح خطة مناسبة.'),
            ),
            FeatureCard(
              icon: Icons.sports_soccer,
              title: 'التشكيلات',
              subtitle: 'خطط وأساليب لعب',
              onTap: () => _showInfo(context, 'التشكيلات',
                  'افتح تبويب التشكيلات من الشريط السفلي.'),
            ),
            FeatureCard(
              icon: Icons.card_giftcard,
              title: 'محاكي البكجات',
              subtitle: 'تجربة فتح بكجات افتراضية',
              onTap: () => _showInfo(context, 'محاكي البكجات',
                  'قريباً: محاكاة ترفيهية فقط، دون شراء أو رصيد حقيقي.'),
            ),
            FeatureCard(
              icon: Icons.phone_android,
              title: 'فحص الجهاز',
              subtitle: 'معلومات التوافق والأداء',
              onTap: () => _showInfo(context, 'فحص الجهاز',
                  'سيتم إضافة معلومات الجهاز في تحديث لاحق.'),
            ),
          ],
        ),
        const SizedBox(height: 22),
        const SectionTitle('آخر التحديثات'),
        const SizedBox(height: 10),
        const InfoTile(
          icon: Icons.update,
          title: 'DEX PES - النسخة الأولى',
          subtitle: 'تم تجهيز الواجهة الأساسية للتطبيق.',
        ),
        const InfoTile(
          icon: Icons.cloud_outlined,
          title: 'البيانات المباشرة',
          subtitle: 'تحتاج إلى ربط مصدر بيانات وسيرفر قبل عرض تحديثات حقيقية.',
        ),
      ],
    );
  }
}

class FormationsPage extends StatelessWidget {
  const FormationsPage({super.key});

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionTitle('التشكيلات والخطط'),
          const SizedBox(height: 8),
          const Text('نماذج أولية قابلة للتعديل لاحقاً',
              style: TextStyle(color: Colors.white60)),
          const SizedBox(height: 14),
          const FormationTile(name: '4-3-3', style: 'هجوم بالأجنحة'),
          const FormationTile(name: '4-2-1-3', style: 'هجوم متوازن'),
          const FormationTile(name: '3-2-3-2', style: 'ضغط واستحواذ'),
          const SizedBox(height: 12),
          const Text(
            'ملاحظة: هذه اقتراحات عامة وليست بيانات رسمية من اللعبة.',
            style: TextStyle(color: Colors.white38, fontSize: 12),
          ),
        ],
      );
}

class PlayersPage extends StatelessWidget {
  const PlayersPage({super.key});

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SectionTitle('قاعدة بيانات اللاعبين'),
          SizedBox(height: 8),
          Text('ستظهر هنا بطاقات اللاعبين والتقييمات بعد ربط مصدر بيانات موثوق.',
              style: TextStyle(color: Colors.white60)),
          SizedBox(height: 18),
          InfoTile(
            icon: Icons.person_search,
            title: 'البحث عن لاعب',
            subtitle: 'ميزة قيد التطوير',
          ),
          InfoTile(
            icon: Icons.compare_arrows,
            title: 'مقارنة اللاعبين',
            subtitle: 'ميزة قيد التطوير',
          ),
        ],
      );
}

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SectionTitle('أخبار eFootball'),
          SizedBox(height: 8),
          Text('سيتم عرض الأخبار هنا بعد ربط واجهة أخبار أو مصدر RSS مناسب.',
              style: TextStyle(color: Colors.white60)),
          SizedBox(height: 18),
          InfoTile(
            icon: Icons.feed_outlined,
            title: 'الأخبار والتحديثات',
            subtitle: 'لا توجد أخبار مباشرة في النسخة التجريبية.',
          ),
        ],
      );
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Material(
        color: panel,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: gold.withOpacity(.25)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: gold, size: 27),
                const SizedBox(height: 9),
                Text(title,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 3),
                Text(subtitle,
                    style:
                        const TextStyle(color: Colors.white54, fontSize: 11)),
              ],
            ),
          ),
        ),
      );
}

class FormationTile extends StatelessWidget {
  final String name;
  final String style;
  const FormationTile({super.key, required this.name, required this.style});

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 11),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: panel,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: gold.withOpacity(.25)),
        ),
        child: Row(
          children: [
            const Icon(Icons.sports_soccer, color: gold, size: 25),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold)),
                  Text(style,
                      style:
                          const TextStyle(color: Colors.white54, fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.chevron_left, color: gold),
          ],
        ),
      );
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const InfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: panel,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: gold),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 3),
                  Text(subtitle,
                      style:
                          const TextStyle(color: Colors.white54, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      );
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
              width: 4,
              height: 19,
              decoration: BoxDecoration(
                  color: gold, borderRadius: BorderRadius.circular(4))),
          const SizedBox(width: 9),
          Text(title,
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        ],
      );
}

void _showInfo(BuildContext context, String title, String message) {
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: panel,
      title: Text(title, style: const TextStyle(color: gold)),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('حسناً', style: TextStyle(color: gold)),
        )
      ],
    ),
  );
}
