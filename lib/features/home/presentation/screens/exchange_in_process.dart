import 'package:berries_p2p_app/features/home/presentation/widgets/custom_avatar.dart';
import 'package:berries_p2p_app/features/home/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:berries_p2p_app/shared/widgets/main_layout.dart';
import 'package:berries_p2p_app/core/theme/app_colors.dart';
import 'package:berries_p2p_app/shared/widgets/custom_card.dart';

class ExchangeInProcess extends StatelessWidget {
  const ExchangeInProcess({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      withBottomNavigation: false,
      withAppBar: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 40),

            Icon(
              Icons.sync_alt_rounded,
              size: 90,
              color: AppColors.primary,
            ),

            SizedBox(height: 24),

            Text(
              'Intercambio en proceso',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 38,
                height: 1.1,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontFamily: 'Gelasio-Bold',
              ),
            ),

            SizedBox(height: 8),

            Text(
              'S/. 100.00',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 4),

            Text(
              'Comisión: S/. 1.00 (1%)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),

            SizedBox(height: 32),

            CustomCard(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CustomAvatar(
                            radius: 30,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Tú',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Entregas efectivo',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward,
                                size: 30,
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: AppColors.primary,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Recibes digital',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomAvatar(
                            radius: 30,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Solicitante',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            CustomCard(
              title: 'Punto de encuentro acordado',
              child: Row(
                children: [
                  Icon(Icons.location_on, color: AppColors.primary),
                  SizedBox(width: 8),
                  Text('Av. Principal 123, Centro'),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Cancelar intercambio'),
                      content: Text('¿Estás seguro de que deseas cancelar este intercambio?'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black87,
                          ),
                          child: Text('No'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                          ),
                          child: Text('Sí'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Cancelar'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Finalizar intercambio', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}