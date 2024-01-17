//
//  CustomStatusBar.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/16.
//

import SwiftUI

struct CustomStatusBar: View {
    @Binding var step: Int
    
    var body: some View {
        ZStack() {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 358, height: 10)
                .background(.white)
                .cornerRadius(30)
                .offset(x: 0, y: 0)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 120, height: 8)
                .background(.black)
                .cornerRadius(30)
                .offset(x: calculateOffset(), y: 0)
                .animation(.easeInOut, value: 0.3)
        }
        .frame(width: 320, height: 10)
    }
}

extension CustomStatusBar {
    func calculateOffset() -> CGFloat {
        switch step {
        case 0:
            return -118
        case 1:
            return 2
        default:
            return 118
        }
    }
}

#Preview {
    CustomStatusBar(step: .constant(0))
}
