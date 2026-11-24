import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const StudentPortalApp());
}

class StudentPortalApp extends StatelessWidget {
  const StudentPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Portal',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        primaryColor: const Color(0xFF193B68),
        useMaterial3: true,
      ),
      home: const StudentDashboard(),
    );
  }
}

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  static const Color navy = Color(0xFF193B68);
  static const Color lightBlue = Color(0xFFE8F1FC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FA),
        title: const Text(
          'Student Portal',
          style: TextStyle(
            color: navy,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: lightBlue,
              child: Icon(Icons.person_outline, color: navy),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Good Morning!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: navy,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Welcome back, Student',
                style: TextStyle(fontSize: 13, color: Colors.blueGrey),
              ),

              const SizedBox(height: 22),

              // Welcome Dashboard Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: navy,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Learning Dashboard',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Manage your academic activities in one place.',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Information Cards
              const Row(
                children: [
                  Expanded(
                    child: InfoCard(
                      icon: Icons.menu_book,
                      number: '5',
                      label: 'My Courses',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InfoCard(
                      icon: Icons.assignment_outlined,
                      number: '3',
                      label: 'Assignments',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InfoCard(
                      icon: Icons.check_circle_outline,
                      number: '12',
                      label: 'Completed Tasks',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                'Upcoming Activities',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: navy,
                ),
              ),

              const SizedBox(height: 12),

              const ActivityCard(
                title: 'Mobile Development Laboratory',
                date: 'November 26, 2026',
              ),

              const SizedBox(height: 10),

              const ActivityCard(
                title: 'Database Management',
                date: 'November 28, 2026',
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // Static Bottom Navigation
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: Colors.white,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavigationItem(
              icon: Icons.home_outlined,
              label: 'Home',
              selected: true,
            ),
            NavigationItem(icon: Icons.menu_book_outlined, label: 'Courses'),
            NavigationItem(
              icon: Icons.calendar_month_outlined,
              label: 'Activities',
            ),
            NavigationItem(icon: Icons.person_outline, label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

// Custom Information Card Widget
class InfoCard extends StatelessWidget {
  final IconData icon;
  final String number;
  final String label;

  const InfoCard({
    super.key,
    required this.icon,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: StudentDashboard.navy, size: 20),
          const SizedBox(height: 8),
          Text(
            number,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: StudentDashboard.navy,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 10, color: StudentDashboard.navy),
          ),
        ],
      ),
    );
  }
}

// Custom Activity Card Widget
class ActivityCard extends StatelessWidget {
  final String title;
  final String date;

  const ActivityCard({super.key, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFE8F1FC),
            child: Icon(
              Icons.calendar_month_outlined,
              color: StudentDashboard.navy,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: StudentDashboard.navy,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  date,
                  style: const TextStyle(fontSize: 10, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Bottom Navigation Item
class NavigationItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const NavigationItem({
    super.key,
    required this.icon,
    required this.label,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: selected ? StudentDashboard.navy : Colors.blueGrey),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: selected ? StudentDashboard.navy : Colors.blueGrey,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
