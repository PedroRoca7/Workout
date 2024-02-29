import Foundation
import WorkoutsCore
import WorkoutPlayer
import SwiftUI
import Payment
import BrowseWorkouts
import Profile

enum Composer {
    static let subscriptionManager = SubscriptionManager.shared
    
    static func makeWorkoutPlayerView(workout: Workout) -> some View {
        UINavigationController(
            rootViewController: WorkoutPlayerViewController(workout: workout)
        )
        .asSwiftUIView
        .edgesIgnoringSafeArea(.all)
    }
    
    static func makePaywallView(_ didFinishPurchase: @escaping () -> Void) -> some View {
        PaywallView(
            viewModel: .init(
                sourceWorkout: nil,
                trackingService: FirebaseAnalyticsPaywallTrackingService(),
                subscriptionManager: subscriptionManager,
                didFinishPurchase: { _ in didFinishPurchase() }
            )
        )
    }
    
    static func makeWorkoutDetailView(workout: Workout) -> some View {
        WorkoutDetail(
            workout: workout,
            makePaywallView: makePaywallView,
            makeWorkoutPlayerView: makeWorkoutPlayerView
        )
    }
    
    static func makeWorkouView() -> some View {
        WorkoutsView(viewModel: .init(service: .live),
                     makeWorkoutDetail: makeWorkoutDetailView)
    }
    
    static func makeProfileView() -> some View {
        ProfileView(
            subscriptionManager: subscriptionManager,
            makePaywallView: makePaywallView
        )
    }
}
