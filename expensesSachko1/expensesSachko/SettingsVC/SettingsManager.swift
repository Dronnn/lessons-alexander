//
//  SettingsManager.swift
//  expensesSachko
//
//  Created by andrew mayer on 15.12.23.
//

import Foundation

class SettingsManager {

    // MARK: - shared instance

    static let shared: SettingsManager = .init()

    // MARK: - keys

    enum Key: String {
        case useFaceID
        case notificationEnabled
        case notificationTime
        case onbording
    }

    // MARK: - objects

    var useFaceID: Bool {
        get {
            UserDefaults.standard.object(
                forKey: Key.useFaceID.rawValue
            ) as? Bool ?? false
        }
        set {
            UserDefaults.standard.setValue(
                newValue,
                forKey: Key.useFaceID.rawValue
            )
        }
    }
    
    var notificationEnabled: Bool {
        get {
            UserDefaults.standard.object(
                forKey: Key.notificationEnabled.rawValue
            ) as? Bool ?? false
        }
        set {
            UserDefaults.standard.setValue(
                newValue,
                forKey: Key.notificationEnabled.rawValue
            )
        }
    }
    
    var notificationTime: Date? {
        get {
            let timeString = UserDefaults.standard.object(
                forKey: Key.notificationTime.rawValue
            ) as? String
            return notificationTimeFromString(timeString)
        }
        set {
            UserDefaults.standard.setValue(
                notificationTimeString(newValue),
                forKey: Key.notificationTime.rawValue
            )
        }
    }
    
    var onbording: Bool {
        get {
            UserDefaults.standard.object(
                forKey: Key.onbording.rawValue
            ) as? Bool ?? false
        }
        set {
            UserDefaults.standard.setValue(
                newValue,
                forKey: Key.onbording.rawValue
            )
        }
    }

}

extension SettingsManager {

    private func notificationTimeString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }

    private func notificationTimeFromString(_ time: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.date(from: time) ?? Date()
    }
}
