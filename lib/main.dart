import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:instant_morfix/simple_bloc_delegate.dart';
import 'package:instant_morfix/widgets/instant_morfix_app.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(InstantMorfixApp());
}
