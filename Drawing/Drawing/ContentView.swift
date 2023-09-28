//
//  ContentView.swift
//  Drawing
//
//  Created by Micol on 23.09.23.
//

import SwiftUI

struct Polygon : Shape {
   var sides = 5

   func path(in rect : CGRect ) -> Path{
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = rect.width / 2
       let smallRadius = radius * 0.6
       
//        let arrowCapWidth = 0.3
//        let maxLength = rect.maxX * 0.9

       //get angle in radians, then double it because we want to skip the first vertex and go to the next
        let angle = Double.pi * 2 / Double(sides) * 2
        var path = Path()
        var startPoint = CGPoint(x: 0, y: 0)
        
        for side in 0 ..< (sides + 1) {
           
            let x = center.x + CGFloat(cos(Double(side) * angle)) * CGFloat (radius)
            let y = center.y + CGFloat(sin(Double(side) * angle)) * CGFloat(radius)
                  
            let vertexPoint = CGPoint( x: x, y: y)
            
//            let arrowCapX = maxLength * 0.95
//            let topArrowCapY = vertexPoint.y * (1 - arrowCapWidth)
//            let bottomArrowCapY = vertexPoint.y * (1 + arrowCapWidth)
            
            if (side == 0) {
                startPoint = vertexPoint
                path.move(to: startPoint )
            }
            else {
                path.addLine(to: vertexPoint)
            }
        }
       
       for side in 0 ..< (sides + 1) {
          
           let x = center.x + CGFloat(cos(Double(side) * angle)) * CGFloat (smallRadius)
           let y = center.y + CGFloat(sin(Double(side) * angle)) * CGFloat(smallRadius)
                 
           let vertexPoint = CGPoint( x: x, y: y)
           
//            let arrowCapX = maxLength * 0.95
//            let topArrowCapY = vertexPoint.y * (1 - arrowCapWidth)
//            let bottomArrowCapY = vertexPoint.y * (1 + arrowCapWidth)
           
           if (side == 0) {
               startPoint = vertexPoint
               path.move(to: startPoint )
           }
           else {
               path.addLine(to: vertexPoint)
           }
       }
       
       
        
        return path
  }
}

struct Arrow: Shape {
    
    func path(in rect: CGRect) -> Path {
        var shape = Path()
        let arrowCapWidth = 0.3
        let maxLength = rect.maxX * 0.9
        let h = (((2 * maxLength) + 1) / 4).squareRoot()
        
        //WOOD (x ; y)
        let woodX = rect.minX
        let woodY = rect.minY + h
        
        //WOOD/EARTH (x ; y)
        let earthX = maxLength
        let earthY = rect.minY + h
        
//        //FIRE (x ; y)
//        let fireX = maxLength / 2
//        let fireY = rect.minY
//        
//        //WATER
//        let waterX = (maxLength - 1) / 4
//        let waterY = h + maxLength.squareRoot()
//        
//        
//        //METAL
//        let metalX = maxLength - waterX
//        let metalY = h + maxLength.squareRoot()
//        
        //arrowcap
        let arrowCapX = maxLength * 0.95
        let topArrowCapY = woodY * (1 - arrowCapWidth)
        let bottomArrowCapY = woodY * (1 + arrowCapWidth)
        
        //WOOD -> EARTH
        //line
        shape.move(to: CGPoint(x: woodX, y: woodY))
        shape.addLine(to: CGPoint(x: earthX, y: earthY))
        
//        arrow tip
        shape.move(to: CGPoint(x: earthX, y: earthY))
        shape.addLine(to: CGPoint(x: arrowCapX, y: topArrowCapY))
        shape.addLine(to: CGPoint(x: arrowCapX, y: bottomArrowCapY))
        shape.closeSubpath()
        
        
        
    
        return shape
    }
}


struct ContentView: View {
    
    var body: some View {
        
        VStack {
            
            Text("Drawing practice")
            Arrow()
                .stroke(.black, style: StrokeStyle(lineWidth: 3, lineJoin: .miter))
            Polygon()
                .stroke(.black, style: StrokeStyle(lineWidth: 3, lineJoin: .miter))
                .rotationEffect(Angle(degrees: -17))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
