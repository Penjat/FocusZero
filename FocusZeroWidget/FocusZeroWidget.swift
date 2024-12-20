//
//  FocusZeroWidget.swift
//  FocusZeroWidget
//
//  Created by Spencer Symington on 2024-12-19.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: "Loading...")
    }

    //    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
    //        SimpleEntry(date: Date(), configuration: configuration)
    //    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        // Quick snapshot for the widget gallery
        let entry = createEntryFromSharedData()
        completion(entry)
    }

    private func createEntryFromSharedData() -> SimpleEntry {
        let sharedDefaults = UserDefaults(suiteName: "group.com.superart.FocusZero")
        let focusText = sharedDefaults?.string(forKey: "currentFocus") ?? "No Focus Set"

        return SimpleEntry(date: Date(), configuration: focusText)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        let entry = createEntryFromSharedData()

        // For simplicity, this timeline does not schedule future updates
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: String
}

struct FocusZeroWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.configuration)
                .foregroundStyle(.white)
                .font(.largeTitle)
                .bold()
        }
    }
}

struct FocusZeroWidget: Widget {
    let kind: String = "FocusZeroWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            FocusZeroWidgetEntryView(entry: entry)
                .containerBackground(Color(red: 154/254, green: 123/254, blue: 201/254), for: .widget)

        }.configurationDisplayName("hi")
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    FocusZeroWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: "hi")
    SimpleEntry(date: .now, configuration: "yo")
}
