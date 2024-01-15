//
//  SettingsView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/15.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isSettingsPopupVisible: Bool
    
    var body: some View {
        Button(action: {
            isSettingsPopupVisible.toggle()
        }) {
            Text("Bye")
        }
    }
}

#Preview {
    SettingsView(isSettingsPopupVisible: .constant(true))
}
