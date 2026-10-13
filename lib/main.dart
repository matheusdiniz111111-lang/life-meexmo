import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const deepBlack = Color(0xFF0E0E11);
    const cardBlack = Color(0xFF18191D);
    const red = Color(0xFFE53935);
    const softText = Color(0xFFEFEFEF);

    return MaterialApp(
      title: 'Life Meexmo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: deepBlack,
        brightness: Brightness.dark,
        primaryColor: red,
        colorScheme: const ColorScheme.dark(
          primary: red,
          secondary: red,
          surface: cardBlack,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121318),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: softText,
          displayColor: softText,
        ),
        cardTheme: CardTheme(
          color: cardBlack,
          elevation: 0,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: red,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 112,
                    height: 112,
                    decoration: BoxDecoration(
                      color: const Color(0xFF171A1F),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: const Color(0xFFE53935),
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.fitness_center,
                      size: 56,
                      color: Color(0xFFE53935),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Life Meexmo',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Força, disciplina e evolução.',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: const Color(0xFF18181C),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      filled: true,
                      fillColor: const Color(0xFF18181C),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const HomeTabsPage(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ainda não tem conta?',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Criar agora',
                          style: TextStyle(
                            color: Color(0xFFE53935),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeTabsPage extends StatefulWidget {
  const HomeTabsPage({super.key});

  @override
  State<HomeTabsPage> createState() => _HomeTabsPageState();
}

class _HomeTabsPageState extends State<HomeTabsPage> {
  int _index = 0;

  final List<Widget> _pages = const [
    RunPage(),
    GymPage(),
    NutritionPage(),
    AchievementsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Life Meexmo'),
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        backgroundColor: const Color(0xFF121318),
        selectedItemColor: const Color(0xFFE53935),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (value) => setState(() => _index = value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'Corrida',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Academia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Alimentação',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Conquistas',
          ),
        ],
      ),
    );
  }
}

class RunPage extends StatelessWidget {
  const RunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        headerCard(
          title: 'Corredor Pro',
          subtitle: 'Evolução física em corrida',
          chip: '21.4 km / semana',
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Última sessão', style: TextStyle(color: Colors.white70)),
                SizedBox(height: 10),
                Text(
                  '10.6 km',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.timer, color: Color(0xFFE53935)),
                    SizedBox(width: 10),
                    Text('48 min 20 s'),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        metricCard('Pace médio', '5:05 /km', Icons.speed),
        metricCard('Distância total', '356.2 km', Icons.route),
        metricCard('VO₂ max', '48.9', Icons.monitor_heart),
      ],
    );
  }
}

class GymPage extends StatelessWidget {
  const GymPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        headerCard(
          title: 'Força e performance',
          subtitle: 'Progresso dos treinos',
          chip: 'Volume total: 5.6k kg',
        ),
        metricCard('Supino', '92 kg', Icons.fitness_center),
        metricCard('Agachamento', '120 kg', Icons.sports_gymnastics),
        metricCard('Peso corporal', '74.8 kg', Icons.monitor_weight),
        metricCard('Sessões este mês', '14', Icons.calendar_today),
      ],
    );
  }
}

class NutritionPage extends StatefulWidget {
  const NutritionPage({super.key});

  @override
  State<NutritionPage> createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
  final ImagePicker picker = ImagePicker();
  XFile? selectedImage;

  Future<void> _pickMealImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (!mounted) return;
    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        headerCard(
          title: 'Planejamento alimentar',
          subtitle: 'Meta de perda de peso',
          chip: 'Consumo diário: 2.150 kcal',
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Meta calorias'),
                    Text('2.300 kcal'),
                  ],
                ),
                const SizedBox(height: 12),
                const LinearProgressIndicator(
                  value: 0.74,
                  minHeight: 10,
                  backgroundColor: Color(0xFF2B2C30),
                  color: Color(0xFFE53935),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Hoje consumiu 1.700 kcal de 2.300 kcal',
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _pickMealImage(ImageSource.camera),
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Câmera'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _pickMealImage(ImageSource.gallery),
                        icon: const Icon(Icons.photo_library),
                        label: const Text('Galeria'),
                      ),
                    ),
                  ],
                ),
                if (selectedImage != null) ...[
                  const SizedBox(height: 18),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.file(
                      File(selectedImage!.path),
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Estimativa aproximada: 420 kcal',
                    style: TextStyle(color: Color(0xFFE53935)),
                  ),
                ],
              ],
            ),
          ),
        ),
        metricCard('Proteína', '140 g', Icons.emoji_food_beverage),
        metricCard('Carboidratos', '220 g', Icons.bakery_dining),
        metricCard('Gorduras', '52 g', Icons.oil_barrel),
      ],
    );
  }
}

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        headerCard(
          title: 'Conquistas e rivalidade',
          subtitle: 'Ranking da semana',
          chip: 'Top 3: 1.700 pts',
        ),
        achievementRow('Maratona da semana', '42 km', '🏅'),
        achievementRow('Consistência', '7 dias', '🔥'),
        achievementRow('Força total', '18.000 kg', '💪'),
        achievementRow('Emagrecimento', '-3.4 kg', '⚖️'),
      ],
    );
  }
}

Widget headerCard({
  required String title,
  required String subtitle,
  required String chip,
}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey[400]),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF2A0D10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              chip,
              style: const TextStyle(
                color: Color(0xFFE53935),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget metricCard(String label, String value, IconData icon) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF2A0D10),
            ),
            child: Icon(icon, color: const Color(0xFFE53935)),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(color: Colors.grey[400]),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget achievementRow(String label, String value, String emoji) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
                Text(value, style: TextStyle(color: Colors.grey[400])),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    ),
  );
}
