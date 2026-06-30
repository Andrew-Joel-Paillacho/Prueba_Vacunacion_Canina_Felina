import 'package:flutter/material.dart';

class AsignarVacunadorPage extends StatefulWidget {
  const AsignarVacunadorPage({super.key});

  @override
  State<AsignarVacunadorPage> createState() => _AsignarVacunadorPageState();
}

class _AsignarVacunadorPageState extends State<AsignarVacunadorPage> {
  String? _selectedSector;
  String? _selectedVacunador;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asignar Vacunador'),
        backgroundColor: const Color(0xFF00695C),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Seleccione el Sector',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedSector,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.map),
              ),
              items: ['Sector Norte A', 'Sector Norte B']
                  .map((sector) {
                return DropdownMenuItem(
                  value: sector,
                  child: Text(sector),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedSector = value;
                });
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Seleccione el Vacunador',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedVacunador,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              items: ['Ana García', 'Luis Rodríguez', 'María Martínez']
                  .map((vacunador) {
                return DropdownMenuItem(
                  value: vacunador,
                  child: Text(vacunador),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedVacunador = value;
                });
              },
            ),
            const SizedBox(height: 24),
            if (_selectedSector != null && _selectedVacunador != null)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info, color: Colors.blue),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Se asignará a $_selectedVacunador al sector $_selectedSector',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: _selectedSector != null && _selectedVacunador != null
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Vacunador asignado exitosamente'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  : null,
              icon: const Icon(Icons.assignment),
              label: const Text('Asignar Vacunador'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFF00695C),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}