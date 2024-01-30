//
//  SettingBlock.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/29.
//

import SwiftUI

struct SettingBlock: View {
    var text: String
    var versionInfo: String?
    
    var body: some View {
        HStack() {
            Text("\(text)")
                .font(.title)
                .foregroundColor(.white)
            Spacer()
            if let versionInfo = versionInfo {
                Text("\(versionInfo)")
                    .foregroundColor(.white)
            }
            Image("RightArrow")
        }
        .padding(10)
        .overlay {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 360, height: 65)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .inset(by: 1)
                        .stroke(.white, lineWidth: 2)
                )
        }
    }
}
