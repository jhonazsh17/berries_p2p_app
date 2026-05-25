import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:berries_p2p_app/features/home/presentation/widgets/custom_box_item.dart';
import 'package:berries_p2p_app/shared/widgets/main_layout.dart';

class Location extends StatefulWidget {
  final Map<String, dynamic>? requester;

  const Location({super.key, this.requester});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  LatLng? _currentPosition;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      // Verificar si los servicios de ubicación están habilitados
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Los servicios de ubicación están deshabilitados
        setState(() {
          _currentPosition = LatLng(-12.0464, -77.0428); // Coordenadas por defecto (Lima)
          _isLoading = false;
        });
        return;
      }

      // Verificar permisos de ubicación
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permisos denegados
          setState(() {
            _currentPosition = LatLng(-12.0464, -77.0428); // Coordenadas por defecto
            _isLoading = false;
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permisos denegados permanentemente
        setState(() {
          _currentPosition = LatLng(-12.0464, -77.0428); // Coordenadas por defecto
          _isLoading = false;
        });
        return;
      }

      // Obtener la ubicación actual
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _currentPosition = LatLng(-12.0464, -77.0428); // Coordenadas por defecto en caso de error
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Ubicación',
      withBottomNavigation: false,
      body: _isLoading ? Center(child: CircularProgressIndicator()) : Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: _currentPosition ?? LatLng(-12.0464, -77.0428),
              initialZoom: 15,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.berries_p2p_app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _currentPosition ?? LatLng(-12.0464, -77.0428),
                    width: 80,
                    height: 80,
                    child: Icon(
                      Icons.location_on,
                      size: 40,
                      color: Colors.red,
                      shadows: [
                        Shadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              children: [
                CustomBoxItem(
                  onTap: () {},
                  requester: widget.requester,
                ),
                //const SizedBox(height: 16),
                /*ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RequestDetail()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 56),
                  ),
                  child: Text('Conectar', style: TextStyle(fontSize: 16)),
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
