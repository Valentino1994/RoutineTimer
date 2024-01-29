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
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isSettingsPopupVisible.toggle()
                    }) {
                        Image(systemName: "x.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 30)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.top, 30)
                    }
                    
                }
                HStack {
                    Text("Settings")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                    Spacer()
                }
                
                NavigationLink(destination: ContactsView()) {
                    SettingBlock(text: "Contacts")
                        .frame(width: 340, height: 66)
                }
                .padding(.bottom, 10)
                
                NavigationLink(destination: VersionView()) {
                    SettingBlock(text: "Version", versionInfo: "1.0.0")
                        .frame(width: 340, height: 66)
                }
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    SettingsView(isSettingsPopupVisible: .constant(true))
}
