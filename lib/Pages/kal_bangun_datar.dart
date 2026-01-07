import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_management/Controllers/counter_bloc.dart';
import 'package:bloc_management/Controllers/counter_event.dart';
import 'package:bloc_management/Controllers/counter_state.dart';

class KalBangunDatar extends StatelessWidget {
  KalBangunDatar({super.key});

  final TextEditingController panjangController = TextEditingController();
  final TextEditingController lebarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "HITUNG PERSEGI PANJANG",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Row(
              spacing: 5,
              children: [
                Expanded(
                  child: TextField(
                    controller: panjangController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      context.read<CounterBloc>().add(
                        PanjangChanged(int.tryParse(value) ?? 0),
                      );
                    },
                    decoration: const InputDecoration(
                      hintText: "Panjang",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: lebarController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      context.read<CounterBloc>().add(
                        LebarChanged(int.tryParse(value) ?? 0),
                      );
                    },
                    decoration: const InputDecoration(
                      hintText: "Lebar",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.all(12),
              child: Row(
                spacing: 9,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(HitungLuas());
                      },
                      child: const Text("LUAS"),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(HitungKeliling());
                      },
                      child: const Text("KELILING"),
                    ),
                  ),
                ],
              ),
            ),

            Spacer(),

            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  "HASIL\n${state.hasil}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  panjangController.clear();
                  lebarController.clear();
                  context.read<CounterBloc>().add(Reset());
                },
                child: const Text("RESET"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
