//
//  Binding-OnChange.swift
//  MediaJournal
//
//  Created by Jake Smith on 8/21/22.
//
import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
    }
}
