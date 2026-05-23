import 'package:flutter/material.dart';
import 'package:berries_p2p_app/core/theme/app_colors.dart';
import 'package:berries_p2p_app/features/home/presentation/widgets/custom_avatar.dart';
import 'package:berries_p2p_app/shared/widgets/main_layout.dart';
import 'package:berries_p2p_app/shared/widgets/custom_card.dart';
import 'package:berries_p2p_app/shared/widgets/notification_banner.dart';
import 'package:berries_p2p_app/features/home/presentation/screens/location.dart';

class RequestDetail extends StatelessWidget {
  final Color _colorPrimary = AppColors.primary;

  const RequestDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Detalle de Solicitud',
      withBottomNavigation: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomAvatar(radius: 50),
              SizedBox(height: 20),
              Text(
                'Monkey D. Luffy',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 4),
                  Text('4.8 (100)'),
                ],
              ),
              SizedBox(height: 16),
              CustomCard(
                title: 'Detalles del intercambio',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Monto', 
                          style: TextStyle(fontWeight: FontWeight.bold, color: _colorPrimary),
                        ),
                        Text('S/ 100.00', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Quiere', 
                          style: TextStyle(fontWeight: FontWeight.bold, color: _colorPrimary),
                        ),
                        Text('Dinero en efectivo'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recibirás', 
                          style: TextStyle(fontWeight: FontWeight.bold, color: _colorPrimary),
                        ),
                        Text('Dinero digital'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              CustomCard(
                title: 'Ubicación',
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Location()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Calle Martin Waiss 101 - Cercado Máncora (Referencia: Porton rojo)', style: TextStyle(fontSize: 14)),
                          SizedBox(height: 4),
                          Text('A 500m de tí', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                        ],
                      ),
                    ), 
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on, color: _colorPrimary, size: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              NotificationBanner(
                text: 'Recuerda: realiza el intercambio en un lugar público y verifica el pago antes de entregar el efectivo',
              ),
              SizedBox(height: 16),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _colorPrimary,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    minimumSize: Size(double.infinity, 56),
                  ),
                  child: Text('Conectar', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
