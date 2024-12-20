//
//  FocusZeroWidgetLiveActivity.swift
//  FocusZeroWidget
//
//  Created by Spencer Symington on 2024-12-19.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct FocusZeroWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct FocusZeroWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: FocusZeroWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension FocusZeroWidgetAttributes {
    fileprivate static var preview: FocusZeroWidgetAttributes {
        FocusZeroWidgetAttributes(name: "World")
    }
}

extension FocusZeroWidgetAttributes.ContentState {
    fileprivate static var smiley: FocusZeroWidgetAttributes.ContentState {
        FocusZeroWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: FocusZeroWidgetAttributes.ContentState {
         FocusZeroWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: FocusZeroWidgetAttributes.preview) {
   FocusZeroWidgetLiveActivity()
} contentStates: {
    FocusZeroWidgetAttributes.ContentState.smiley
    FocusZeroWidgetAttributes.ContentState.starEyes
}
