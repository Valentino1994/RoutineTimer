//
//  ContactsView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/29.
//

import SwiftUI

struct ContactsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Contacts")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
            VStack(alignment: .leading) {
                Text("If there is any idea or inconvenience for this app, just mail to me.")
                Text("Thank you")
                    .padding(.top, 3)
            }
            .padding(.leading, 14)
            .padding(.bottom, 10)
            
            VStack() {
                Text("E-mail")
                Text(verbatim: "demua1994@gmail.com")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .overlay {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 360, height: 120)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .inset(by: 1)
                            .stroke(.white, lineWidth: 2)
                    )
            }
            .padding(.top, 40)
            
            Spacer()
        }
    }
}

#Preview {
    ContactsView()
}
