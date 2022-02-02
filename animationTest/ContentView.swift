//
//  ContentView.swift
//  animationTest
//
//  Created by Bicen Zhu on 2022/1/30.
//

import SwiftUI

struct ContentView: View {
    @State var isFaceUp : Bool = true
    var body: some View {
        
        VStack {
            ZStack {
                // RoundedRectangle(cornerRadius: 200).border(Color.red, width: 10)
                let shape = RoundedRectangle(cornerRadius: 20)
                if !isFaceUp {
                    shape.fill().foregroundColor(Color.red)
                }
                shape.strokeBorder(lineWidth: 5, antialiased: true)
                GeometryReader { geometry in
                    // shape.strokeBorder()
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            if isFaceUp {
                                Text("🐯")
                                    .font(.system(size: min(geometry.size.width, geometry.size.height) * 0.7)).padding()
                            } else {
                                shape.fill().foregroundColor(Color.red)
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }.rotation3DEffect(Angle.degrees(isFaceUp ? 0 : 180), axis: (0, 1, 0))
            
            HStack {
                Button(
                    action: {
                        withAnimation(.linear(duration: 2)) {
                            isFaceUp = !isFaceUp
                        }
                    },
                    label: {
                        Image(systemName: "heart.circle")
                    }
                )
                Button(
                    action: {
                        withAnimation(.linear(duration: 2)) {
                            isFaceUp = !isFaceUp
                        }
                    },
                    label: {
                        Image(systemName: "arrow.left.and.right.righttriangle.left.righttriangle.right.fill")
                    }
                )
            }
        }.foregroundColor(.red).padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
