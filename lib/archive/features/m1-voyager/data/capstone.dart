import 'dart:async';
import 'dart:io';

// ==========================================
// 1. DATA MODELS (Fase 2: Generics & Casting)
// ==========================================

// Wrapper untuk semua jenis pesanan
class Order<T> {
  final String orderId;
  final T detail; // T bisa berupa Food atau Drink
  final DateTime timestamp;

  Order({required this.orderId, required this.detail})
      : timestamp = DateTime.now();
}

class Food {
  final String name;
  Food(this.name);
  @override
  String toString() => "MAKANAN: $name";
}

class Drink {
  final String name;
  Drink(this.name);
  @override
  String toString() => "MINUMAN: $name";
}

// ==========================================
// 2. KANTIN SERVICE (Fase 3: The Data Conduit)
// ==========================================

class KantinService {
  // .broadcast() supaya banyak listener bisa dengerin pipa yang sama
  final _orderController = StreamController<Order>.broadcast();

  // Sink: Tempat masukin pesanan baru
  StreamSink<Order> get orderSink => _orderController.sink;

  // Stream: Ujung pipa buat didengerin
  Stream<Order> get orderStream => _orderController.stream;

  void dispose() {
    _orderController.close();
  }
}

// ==========================================
// 3. MAIN EXECUTION (Simulation)
// ==========================================

void main() async {
  final kantin = KantinService();
  int orderCount = 1;

  print("=== SELAMAT DATANG DI KANTIN DIGITAL ITS ===");
  print("Format: 'makan:Nama' atau 'minum:Nama'");
  print("Ketik 'exit' untuk menutup kantin.\n");

  // --- LISTENER 1: Bagian Dapur (Cuma dengerin pesanan makanan) ---
  kantin.orderStream.where((order) => order.detail is Food).listen((order) {
    print("\n👨‍🍳 [DAPUR]: Siap! Memasak ${order.detail}");
  });

  // --- LISTENER 2: Bagian Barista (Cuma dengerin pesanan minuman) ---
  kantin.orderStream.where((order) => order.detail is Drink).listen((order) {
    print("\n☕ [BARISTA]: Siap! Membuat ${order.detail}");
  });

  // --- LISTENER 3: Bagian Kasir (Catat semua transaksi) ---
  kantin.orderStream.listen((order) {
    print(
        "💰 [KASIR]: Mencatat pesanan #${order.orderId} pada ${order.timestamp}");
  });

  // --- SIMULASI INPUT USER SECARA REAL-TIME ---
  // Kita pake loop biar program nungguin ketikan lo di terminal
  while (true) {
    stdout.write("> Masukkan Pesanan: ");
    String? input = stdin.readLineSync();

    if (input == null || input.toLowerCase() == 'exit') {
      print("\nKantin tutup. Sampai jumpa!");
      break;
    }

    // Parsing input sederhana (makan:Nasi atau minum:Es)
    if (input.contains(':')) {
      var parts = input.split(':');
      var type = parts[0].trim().toLowerCase();
      var name = parts[1].trim();

      if (type == 'makan') {
        kantin.orderSink
            .add(Order(orderId: "ORD-${orderCount++}", detail: Food(name)));
      } else if (type == 'minum') {
        kantin.orderSink
            .add(Order(orderId: "ORD-${orderCount++}", detail: Drink(name)));
      } else {
        print("❌ Format salah! Gunakan makan: atau minum:");
      }
    } else {
      print("❌ Format salah! Contoh: makan:Geprek");
    }

    // Kasih delay dikit biar output Stream muncul rapi
    await Future.delayed(Duration(milliseconds: 100));
  }

  kantin.dispose();
}
