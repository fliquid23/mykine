import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api_client.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  const baseUrl = String.fromEnvironment('API_BASE_URL', defaultValue: 'https://api.example.com');
  return ApiClient(baseUrl);
});

final appointmentsProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final api = ref.read(apiClientProvider);
  final res = await api.getAppointments();
  // Por ahora, devolvemos una lista simulada si no hay API real
  return (res.data is List) ? List<Map<String, dynamic>>.from(res.data) : [];
});
