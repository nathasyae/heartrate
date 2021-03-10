import 'dart:ffi';

class Doctor {
  final String id;
  final String name;
  final String specialization;
  final double rating;
  final int years;
  final double price;

  Doctor({this.id, this.name, this.specialization, this.rating, this.years, this.price});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      specialization: json['specialization'],
      rating: json['rating'],
      years: json['years'],
      price: json['price'],
    );
  }
}