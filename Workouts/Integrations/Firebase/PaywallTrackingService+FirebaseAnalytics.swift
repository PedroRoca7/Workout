import FirebaseAnalytics
import Foundation
import WorkoutsCore
import Payment

struct FirebaseAnalyticsPaywallTrackingService: PaywallTrackingService {
    func trackView(workout: WorkoutsCore.Workout?) {
        Analytics.logEvent(
            "Hit Paywall",
            parameters: ["workoutID": workout?.id ?? "no workout"]
        )
    }
    
    func trackPurchase(workout: WorkoutsCore.Workout?) {
        Analytics.logEvent(
            "New Subscription",
            parameters: ["workoutID": workout?.id ?? "no workout"]
        )
    }
}
