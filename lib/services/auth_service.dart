import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_model.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Método para iniciar sesión con verificación completa
  Future<AuthResult> login(String email, String password) async {
    try {
      // 1. Autenticar usuario con email y contraseña
      final AuthResponse authResponse = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      // Verificar que el usuario existe en Auth
      if (authResponse.user == null) {
        return AuthResult(
          success: false,
          error: 'Usuario o contraseña incorrectos',
        );
      }

      // Obtener el UID del usuario autenticado
      final String uid = authResponse.user!.id;

      // 2. Buscar el usuario en la tabla 'usuarios'
      final response = await _supabase
          .from('usuarios')
          .select()
          .eq('uid', uid)
          .maybeSingle();

      // Verificar que el usuario existe en la tabla
      if (response == null) {
        // Si no existe en la tabla, cerramos sesión inmediatamente
        await _supabase.auth.signOut();
        return AuthResult(
          success: false,
          error: 'Usuario no autorizado. Contacte al administrador.',
        );
      }

      // 3. Mapear la respuesta a UserData
      final userData = UserData.fromJson(response);

      // 4. Verificar que el usuario tiene un rol válido
      if (!userData.hasValidRole()) {
        await _supabase.auth.signOut();
        return AuthResult(
          success: false,
          error: 'El usuario no tiene un rol válido asignado.',
        );
      }

      // 5. Verificar que el email coincide con el de autenticación
      if (userData.email != email) {
        await _supabase.auth.signOut();
        return AuthResult(
          success: false,
          error: 'Inconsistencia en los datos del usuario.',
        );
      }

      // 6. Todo verificado, retornar éxito con los datos del usuario
      return AuthResult(
        success: true,
        userData: userData,
        error: null,
      );

    } on AuthException catch (e) {
      // Manejar errores específicos de autenticación
      String errorMessage = 'Error de autenticación';
      if (e.message.contains('Invalid login credentials')) {
        errorMessage = 'Email o contraseña incorrectos';
      } else if (e.message.contains('Email not confirmed')) {
        errorMessage = 'Por favor, confirme su email antes de iniciar sesión';
      } else {
        errorMessage = e.message;
      }
      
      return AuthResult(
        success: false,
        error: errorMessage,
      );
      
    } catch (e) {
      print('Error en login: $e');
      return AuthResult(
        success: false,
        error: 'Error al iniciar sesión. Intente nuevamente.',
      );
    }
  }

  // Método para cerrar sesión
  Future<void> logout() async {
    try {
      await _supabase.auth.signOut();
    } catch (e) {
      print('Error al cerrar sesión: $e');
    }
  }

  // Método para obtener el usuario actual (solo de Auth)
  User? getCurrentAuthUser() {
    return _supabase.auth.currentUser;
  }

  // Método para verificar si el usuario está autenticado en Auth
  bool isAuthenticated() {
    return _supabase.auth.currentUser != null;
  }

  // Método para verificar el estado de la sesión
  Future<bool> checkSession() async {
    try {
      final session = _supabase.auth.currentSession;
      return session != null;
    } catch (e) {
      return false;
    }
  }
}

// Clase para manejar el resultado de autenticación
class AuthResult {
  final bool success;
  final UserData? userData;
  final String? error;

  AuthResult({
    required this.success,
    this.userData,
    this.error,
  });
}