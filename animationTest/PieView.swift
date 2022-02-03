//
//  PieView.swift
//  animationTest
//
//  Created by Bicen Zhu on 2022/2/3.
//

import SwiftUI

struct PieView: View {
    @State var startDegree : Double = -90
    var body: some View {
        VStack {
            Pie(startAngle: Angle.degrees(startDegree),
                endAngle: Angle.degrees(270),
                clockWise: false)
                .foregroundColor(.green)
                .animation(.linear(duration: 10), value: startDegree)
            
            Button("Start") {
                startDegree = 270
            }
        }
    }
}

struct PieView_Previews: PreviewProvider {
    static var previews: some View {
        PieView()
    }
}
