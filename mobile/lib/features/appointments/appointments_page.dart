import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'appointments_repository.dart';

class AppointmentsPage extends ConsumerWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAppointments = ref.watch(appointmentsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Turnos')),
      body: asyncAppointments.when(
        data: (items) => ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, i) => ListTile(
            title: Text('Turno #${i + 1}'),
            subtitle: Text(items[i].toString()),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Crear turno: TODO')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
