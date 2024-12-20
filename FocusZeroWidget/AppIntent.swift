//
//  AppIntent.swift
//  FocusZeroWidget
//
//  Created by Spencer Symington on 2024-12-19.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "My Focus is:", default: "")
    var favoriteEmoji: String
}
