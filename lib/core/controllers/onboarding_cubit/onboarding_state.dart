part of 'onboarding_cubit.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

final class OnboardingLast extends OnboardingState {}

final class OnboardingNotLast extends OnboardingState {}
