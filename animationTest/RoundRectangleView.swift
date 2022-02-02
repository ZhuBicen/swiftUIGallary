//
//  RoundRectangleView.swift
//  animationTest
//
//  Created by Bicen Zhu on 2022/1/30.
//

import SwiftUI

//
//  ContentView.swift
//  animationTest
//
//  Created by Bicen Zhu on 2022/1/30.
//

import SwiftUI

struct RoundedRectangleView: View {
    @State var isFaceUp : Bool = true
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 25)
            RoundedRectangle(cornerRadius: 25).background(Color.green)
            ZStack {
                RoundedRectangle(cornerRadius: 25).strokeBorder(lineWidth: 5)
                RoundedRectangle(cornerRadius: 25).fill()
            }
            RoundedRectangle(cornerRadius: 25).background(Color.red)
            RoundedRectangle(cornerRadius: 25).border(Color.red, width:3)
        }.padding()
    }
}

struct RoundedRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleView()
    }
}


