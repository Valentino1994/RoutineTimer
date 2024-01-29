//
//  VersionView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/29.
//

import SwiftUI

struct VersionView: View {
    var versionInfo: String?
    
    var body: some View {
        VStack {
            HStack {
                Text("Version")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            
            HStack() {
                Text("Version")
                    .font(.title3)
                    .foregroundColor(.white)
                Spacer()
                if let versionInfo = versionInfo {
                    Text("\(versionInfo)")
                        .foregroundColor(.white)
                }
            }
            .frame(width: 330)
            .padding(20)
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
            .padding(.bottom, 16)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Third Parties")
                        .font(.title3)
                        .foregroundColor(.white)
                        
                    Spacer()
                }
                Spacer()
            }
            .padding(16)
            .frame(width: 360, height: 540)
            .overlay {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 360, height: 540)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .inset(by: 1)
                            .stroke(.white, lineWidth: 2)
                    )
            }
        }
    }
}

#Preview {
    VersionView()
}
