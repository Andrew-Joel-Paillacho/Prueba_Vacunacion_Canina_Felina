import 'package:flutter/material.dart';
import 'crear_sector_page.dart';
import 'crear_coordinador_page.dart';
import 'asignar_coordinador_page.dart';

class PromotorDashboard extends StatefulWidget {
  const PromotorDashboard({super.key});

  @override
  State<PromotorDashboard> createState() => _PromotorDashboardState();
}

class _PromotorDashboardState extends State<PromotorDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const _DashboardContent(),
    const _SectoresContent(),
    const _CoordinadoresContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel Promotor'),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Sectores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Coordinadores',
          ),
        ],
      ),
      floatingActionButton: _getFloatingActionButton(),
    );
  }

  Widget? _getFloatingActionButton() {
    if (_selectedIndex == 1) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CrearSectorPage()),
          );
        },
        backgroundColor: const Color(0xFF1A237E),
        child: const Icon(Icons.add),
      );
    } else if (_selectedIndex == 2) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CrearCoordinadorPage()),
          );
        },
        backgroundColor: const Color(0xFF1A237E),
        child: const Icon(Icons.add),
      );
    }
    return null;
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildStatsCard(
                  'Sectores Totales',
                  '12',
                  Icons.map,
                  Colors.green,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatsCard(
                  'Coordinadores',
                  '8',
                  Icons.person,
                  Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatsCard(
                  'Vacunaciones Hoy',
                  '45',
                  Icons.health_and_safety,
                  Colors.orange,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatsCard(
                  'Eficiencia',
                  '92%',
                  Icons.trending_up,
                  Colors.purple,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Actividad Reciente',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildActivityItem(
                    'Nuevo sector creado: Zona Norte',
                    'Hace 2 horas',
                    Icons.add_location,
                  ),
                  _buildActivityItem(
                    'Coordinador asignado: Juan Pérez',
                    'Hace 3 horas',
                    Icons.person_add,
                  ),
                  _buildActivityItem(
                    'Vacunación completada: 15 mascotas',
                    'Hace 5 horas',
                    Icons.pets,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(String text, String time, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectoresContent extends StatelessWidget {
  const _SectoresContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.map, color: Colors.green),
            title: const Text('Zona Norte'),
            subtitle: const Text('Coordinador: Juan Pérez • 45 vacunaciones'),
            trailing: IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AsignarCoordinadorPage(),
                  ),
                );
              },
            ),
          ),
        ),
        Card(
          child: const ListTile(
            leading: Icon(Icons.map, color: Colors.orange),
            title: Text('Zona Sur'),
            subtitle: Text('Coordinador: María Gómez • 32 vacunaciones'),
          ),
        ),
        Card(
          child: const ListTile(
            leading: Icon(Icons.map, color: Colors.purple),
            title: Text('Zona Este'),
            subtitle: Text('Coordinador: Sin asignar • 0 vacunaciones'),
          ),
        ),
        Card(
          child: const ListTile(
            leading: Icon(Icons.map, color: Colors.blue),
            title: Text('Zona Oeste'),
            subtitle: Text('Coordinador: Carlos Ruiz • 28 vacunaciones'),
          ),
        ),
      ],
    );
  }
}

class _CoordinadoresContent extends StatelessWidget {
  const _CoordinadoresContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Card(
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('JP'),
            ),
            title: const Text('Juan Pérez'),
            subtitle: const Text('Sector: Zona Norte • 8 vacunadores'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    // Editar coordinador
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.swap_horiz, color: Colors.orange),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AsignarCoordinadorPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Card(
          child: const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text('MG'),
            ),
            title: Text('María Gómez'),
            subtitle: Text('Sector: Zona Sur • 6 vacunadores'),
          ),
        ),
        Card(
          child: const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text('CR'),
            ),
            title: Text('Carlos Ruiz'),
            subtitle: Text('Sector: Zona Oeste • 4 vacunadores'),
          ),
        ),
      ],
    );
  }
}