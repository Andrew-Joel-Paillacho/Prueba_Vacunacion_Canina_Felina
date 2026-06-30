import 'package:flutter/material.dart';
import 'crear_vacunador_page.dart';
import 'asignar_vacunador_page.dart';
import 'corregir_registros_page.dart';

class BrigadierDashboard extends StatefulWidget {
  const BrigadierDashboard({super.key});

  @override
  State<BrigadierDashboard> createState() => _BrigadierDashboardState();
}

class _BrigadierDashboardState extends State<BrigadierDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const _DashboardContent(),
    const _SectoresAsignadosContent(),
    const _VacunadoresContent(),
    const _RegistrosContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel Brigadier'),
        backgroundColor: const Color(0xFF00695C),
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
            icon: Icon(Icons.people),
            label: 'Vacunadores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Registros',
          ),
        ],
      ),
      floatingActionButton: _getFloatingActionButton(),
    );
  }

  Widget? _getFloatingActionButton() {
    if (_selectedIndex == 2) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CrearVacunadorPage()),
          );
        },
        backgroundColor: const Color(0xFF00695C),
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
          Card(
            color: Colors.green[50],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.green, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sector Asignado',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const Text(
                          'Zona Norte',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Coordinador: Juan Pérez',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatsCard(
                  'Vacunadores',
                  '8',
                  Icons.people,
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatsCard(
                  'Vacunaciones Hoy',
                  '23',
                  Icons.health_and_safety,
                  Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatsCard(
                  'Pendientes',
                  '5',
                  Icons.pending,
                  Colors.red,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatsCard(
                  'Completadas',
                  '18',
                  Icons.check_circle,
                  Colors.green,
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
                    'Registros Recientes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildRecordItem('Fido - Vacuna antirrábica', 'Hace 1 hora'),
                  _buildRecordItem('Luna - Vacuna triple', 'Hace 2 horas'),
                  _buildRecordItem('Max - Vacuna antirrábica', 'Hace 3 horas'),
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
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Icon(icon, size: 30, color: color),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordItem(String title, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.pets, size: 20, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: Text(title),
          ),
          Text(
            time,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

class _SectoresAsignadosContent extends StatelessWidget {
  const _SectoresAsignadosContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Card(
          elevation: 4,
          color: Colors.green[50],
          child: const ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green),
            title: Text('Zona Norte (Activo)'),
            subtitle: Text('8 vacunadores • 23 vacunaciones hoy'),
            trailing: Icon(Icons.arrow_forward, color: Colors.green),
          ),
        ),
        Card(
          child: const ListTile(
            leading: Icon(Icons.location_on, color: Colors.blue),
            title: Text('Sector Norte A'),
            subtitle: Text('3 vacunadores • 8 vacunaciones hoy'),
          ),
        ),
        Card(
          child: const ListTile(
            leading: Icon(Icons.location_on, color: Colors.blue),
            title: Text('Sector Norte B'),
            subtitle: Text('5 vacunadores • 15 vacunaciones hoy'),
          ),
        ),
      ],
    );
  }
}

class _VacunadoresContent extends StatelessWidget {
  const _VacunadoresContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Card(
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('AG'),
            ),
            title: const Text('Ana García'),
            subtitle: const Text('Vacunador • Sector Norte A'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.swap_horiz, color: Colors.orange),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AsignarVacunadorPage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Text('LR'),
            ),
            title: const Text('Luis Rodríguez'),
            subtitle: const Text('Vacunador • Sector Norte B'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.swap_horiz, color: Colors.orange),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AsignarVacunadorPage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        Card(
          child: const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text('MM'),
            ),
            title: Text('María Martínez'),
            subtitle: Text('Vacunador • Sector Norte A'),
          ),
        ),
      ],
    );
  }
}

class _RegistrosContent extends StatelessWidget {
  const _RegistrosContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Card(
          color: Colors.red[50],
          child: ListTile(
            leading: const Icon(Icons.error, color: Colors.red),
            title: const Text('Corrección Pendiente'),
            subtitle: const Text('Fido - Vacuna antirrábica'),
            trailing: IconButton(
              icon: const Icon(Icons.edit, color: Colors.red),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CorregirRegistrosPage(),
                  ),
                );
              },
            ),
          ),
        ),
        Card(
          child: const ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green),
            title: Text('Luna - Vacuna triple'),
            subtitle: Text('Registro completado • Hace 2 horas'),
          ),
        ),
        Card(
          child: const ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green),
            title: Text('Max - Vacuna antirrábica'),
            subtitle: Text('Registro completado • Hace 3 horas'),
          ),
        ),
      ],
    );
  }
}