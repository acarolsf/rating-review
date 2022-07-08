//
//  UserDefaults+Extensions.swift
//  rating-review
//
//  Created by Ana Carolina Ferreira on 08/07/22.
//

import Foundation

extension UserDefaults {
    enum UserDefaultsKeys: String {
        case lastVersion
        case numberOfTimesLaunched
    }
}

extension UserDefaults {
    func eraseUsersDefaultData() {
        guard let appDomain = Bundle.main.bundleIdentifier else {
            return
        }
        
        removePersistentDomain(forName: appDomain)
        synchronize()
    }
}
