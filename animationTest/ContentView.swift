//
//  ContentView.swift
//  animationTest
//
//  Created by Bicen Zhu on 2022/1/30.
//

import SwiftUI

struct ContentView: View {
    @State var isFaceUp : Bool = true
    @State var startDegree : Double = -90
    @State var isDealtCard : Bool = false
    @Namespace var dealingNamespace
    var body: some View {
    
        VStack {
            Card(content: "🍯").cardify(isFaceUp: isFaceUp, startDegree: startDegree)
            if isDealtCard {
                Card(content: "🐯").cardify(isFaceUp: true, startDegree: startDegree)
                    .transition(AnyTransition.asymmetric(insertion: .identity, removal: .identity))
                    .matchedGeometryEffect(id: 1, in: dealingNamespace)
                    .zIndex(1)
            } else {
                Color.clear
            }

            Spacer()
            
                HStack {
                    Color.clear
                    ZStack {
                        if !isDealtCard {
                        Card(content: "🐯").cardify(isFaceUp: true, startDegree: startDegree)
                            .matchedGeometryEffect(id: 1, in: dealingNamespace)
                            .transition(AnyTransition.asymmetric(insertion: .identity, removal: .identity))
                            .zIndex(1)
                        }
                            Card(content: "🐧").cardify(isFaceUp: true, startDegree: startDegree)
                                .matchedGeometryEffect(id: 2, in: dealingNamespace)
                                .zIndex(0)
                        
                    }
                }
            
            
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
                
                Button("Animate") {
                    withAnimation(.linear(duration : 10)) {
                        if startDegree == -90 {
                            startDegree = 270
                        } else {
                            startDegree = -90
                        }
                    }
                }
                
                Button ("DealCard") {
                    withAnimation(.linear(duration: 3)) {
                        isDealtCard = !isDealtCard
                    }
                }
            }
        }.foregroundColor(.red).padding()
    }
}

struct Card : View {
    var content : String

    var body : some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(content).font(.system(size: min(geometry.size.width, geometry.size.height) * 0.7)).padding()
                    Spacer()
                }
                Spacer()
            }
        }
    }
}


struct Cardify : AnimatableModifier {
 
    init(isFaceUp : Bool, startDegree : Double) {
        self.rotation = isFaceUp ? 0 : 180
        self.startDegree = startDegree
    }
        
    var rotation : Double
    var startDegree : Double = -90
    
    var animatableData: Double {
        set { rotation = newValue }
        get { rotation }
    }
    func body(content: Content) -> some View {
        ZStack (alignment: .top) {
            Pie(startAngle: Angle.degrees(startDegree),
                endAngle: Angle.degrees(270),
                clockWise: false)
                .foregroundColor(.green)
            let shape = RoundedRectangle(cornerRadius: 20)
            if rotation < 90 {
                shape.strokeBorder(lineWidth: 2, antialiased: true)
                content
            } else {
                shape.fill().foregroundColor(.red)
            }
        }.rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
}

extension View {
    func cardify(isFaceUp : Bool, startDegree : Double) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, startDegree: startDegree))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
