class UserData {
  final String uid;
  final String? displayName;
  final String email;
  final String? phone;
  final List<String> providers;
  final String? providerType;
  final String rol;

  UserData({
    required this.uid,
    this.displayName,
    required this.email,
    this.phone,
    required this.providers,
    this.providerType,
    required this.rol,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      uid: json['uid']?.toString() ?? '',
      displayName: json['display_name'] ?? json['displayName'],
      email: json['email'] ?? '',
      phone: json['phone'],
      providers: json['providers'] != null 
          ? List<String>.from(json['providers']) 
          : ['Email'],
      providerType: json['provider_type'] ?? json['providerType'],
      rol: json['rol']?.toString().toLowerCase() ?? 'promotor',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'display_name': displayName,
      'email': email,
      'phone': phone,
      'providers': providers,
      'provider_type': providerType,
      'rol': rol,
    };
  }

  // Métodos para verificar el rol
  bool isPromotor() => rol.toLowerCase() == 'promotor';
  bool isBrigadier() => rol.toLowerCase() == 'brigadier';
  bool isVacunador() => rol.toLowerCase() == 'vacunador';
  
  bool hasValidRole() {
    return isPromotor() || isBrigadier() || isVacunador();
  }

  // Método para obtener el nombre del rol en español
  String getRolName() {
    switch (rol.toLowerCase()) {
      case 'promotor':
        return 'Promotor';
      case 'brigadier':
        return 'Brigadier';
      case 'vacunador':
        return 'Vacunador';
      default:
        return rol;
    }
  }
}