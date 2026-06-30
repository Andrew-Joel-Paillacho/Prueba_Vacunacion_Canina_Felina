import 'package:flutter/material.dart';

class AsignarCoordinadorPage extends StatefulWidget {
  const AsignarCoordinadorPage({super.key});

  @override
  State<AsignarCoordinadorPage> createState() => _AsignarCoordinadorPageState();
}

class _AsignarCoordinadorPageState extends State<AsignarCoordinadorPage> {
  String? _selectedSector;
  String? _selectedCoordinador;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asignar Coordinador a Sector'),
        backgroundColor: const Color(0xFF1A237E),
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
              items: ['Zona Norte', 'Zona Sur', 'Zona Este', 'Zona Oeste']
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
              'Seleccione el Coordinador',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedCoordinador,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              items: ['Juan Pérez', 'María Gómez', 'Carlos Ruiz']
                  .map((coordinador) {
                return DropdownMenuItem(
                  value: coordinador,
                  child: Text(coordinador),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCoordinador = value;
                });
              },
            ),
            const SizedBox(height: 24),
            if (_selectedSector != null && _selectedCoordinador != null)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Se asignará a $_selectedCoordinador al sector $_selectedSector',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: _selectedSector != null && _selectedCoordinador != null
                  ? () {
                      // Asignar coordinador
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Coordinador asignado exitosamente'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  : null,
              icon: const Icon(Icons.assignment),
              label: const Text('Asignar Coordinador'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFF1A237E),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}