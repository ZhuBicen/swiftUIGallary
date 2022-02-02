//
//  ContentView.swift
//  animationTest
//
//  Created by Bicen Zhu on 2022/1/30.
//

import SwiftUI

struct ContentView: View {
    @State var isFaceUp : Bool = false
    var body: some View {
        
        VStack {
            Card().cardify(isFaceUp: isFaceUp)
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

struct Card : View {

    var body : some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("🐯").font(.system(size: min(geometry.size.width, geometry.size.height) * 0.7)).padding()
                    Spacer()
                }
                Spacer()
            }
        }
    }
}


struct Cardify : AnimatableModifier {
 
    init(isFaceUp : Bool) {
        self.rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp : Bool = false
    
    var rotation : Double
    
    var animatableData: Double {
        set { rotation = newValue }
        get { rotation }
    }
    func body(content: Content) -> some View {
        ZStack (alignment: .top) {
            let shape = RoundedRectangle(cornerRadius: 20)
            if rotation < 90 {
                shape.strokeBorder(lineWidth: 5, antialiased: true)
                content
            } else {
                shape.fill().foregroundColor(.red)
            }
        }.rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
}

extension View {
    func cardify(isFaceUp : Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
