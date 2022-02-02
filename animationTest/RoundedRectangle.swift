//
//  RoundedRectangle.swift
//  animationTest
//
//  Created by Bicen Zhu on 2022/1/31.
//

import SwiftUI

struct RoundedRectangle2: View {
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            shape.fill()
            shape.strokeBorder(lineWidth: 10).foregroundColor(Color.green)
            //RoundedRectangle(cornerRadius: 25).fill().foregroundColor(Color.red)
        }.padding()
    }
}

struct RoundedRectangle2_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangle2()
    }
}
