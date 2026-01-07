import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_management/Controllers/counter_bloc.dart';
import 'package:bloc_management/Controllers/counter_event.dart';
import 'package:bloc_management/Controllers/counter_state.dart';

class KalBangunDatar extends StatelessWidget {
  const KalBangunDatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Persegi Panjang")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Text(
              "HITUNG PERSEGI PANJANG",
              style: TextStyle(fontSize: 20),
            ),

            Row(
              spacing: 5,
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      context.read<CounterBloc>().add(
                        PanjangChanged(int.tryParse(value) ?? 0),
                      );
                    },
                    decoration: const InputDecoration(
                      hintText: "Input Panjang",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      context.read<CounterBloc>().add(
                        LebarChanged(int.tryParse(value) ?? 0),
                      );
                    },
                    decoration: const InputDecoration(
                      hintText: "Input Lebar",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                spacing: 10,
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

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(Reset());
                      },
                      child: const Text("RESET"),
                    ),
                  ),
                ],
              ),
            ),

            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(
                      "HASIL: ${state.hasil}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
