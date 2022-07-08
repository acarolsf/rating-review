//
//  RatingManager.swift
//  rating-review
//
//  Created by Ana Carolina Ferreira on 08/07/22.
//

import StoreKit

struct RatingManager {
    
    static let MAX_LAUNCHED_TO_SHOW = 1
    
    static func displayStoreKit() {
        let currentVersion = getCurrentAppVersion()
        
        let lastVersionPromptedForReview = UserDefaults.standard.string(forKey: UserDefaults.UserDefaultsKeys.lastVersion.rawValue)
        let numberOfTimesLaunched: Int = UserDefaults.standard.integer(forKey: UserDefaults.UserDefaultsKeys.numberOfTimesLaunched.rawValue)
        
        if numberOfTimesLaunched > MAX_LAUNCHED_TO_SHOW && currentVersion != lastVersionPromptedForReview {
            if #available(iOS 14.0, *) {
                requestReview()
            } else {
                SKStoreReviewController.requestReview()
            }
            UserDefaults.standard.set(currentVersion, forKey: UserDefaults.UserDefaultsKeys.lastVersion.rawValue)
        }
        
    }
    
    // This calls in AppDelegate, to increment
    static func incrementNumberOfTimesLaunched() {
        let numberOfTimesLaunched: Int = UserDefaults.standard.integer(forKey: UserDefaults.UserDefaultsKeys.numberOfTimesLaunched.rawValue) + 1
        
        UserDefaults.standard.set(numberOfTimesLaunched, forKey: UserDefaults.UserDefaultsKeys.numberOfTimesLaunched.rawValue)
    }
    
    static func getCurrentAppVersion() -> String {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"], let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else {
            
            return "0"
        }
        
        let appVersion = "\(version).\(build)"
        
        return appVersion
    }
    
    static func requestReview() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
}
