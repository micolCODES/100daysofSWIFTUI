//
//  ContentView.swift
//  Drawing
//
//  Created by Micol on 23.09.23.
//

import SwiftUI

struct Polygon : Shape {
   var sidesPenta = 5
    var sidesPoly = 80

   func path(in rect : CGRect ) -> Path{
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = rect.width / 2
       var path = Path()


       //get angle in radians, then double it because we want to skip the first vertex and go to the next
//        let angle = Double.pi * 2 / Double(sidesPenta)        
//       var startPoint = CGPoint(x: 0, y: 0)
       
       //Decagon
       let anglePoly = Double.pi * 2 / Double(sidesPoly)
       let radiusPoly = radius * 0.8
       //let radiusPoly = radius * CGFloat(cos(anglePoly))
       
       let vertexIWant = [7, 9, 23, 25, 39, 41, 55, 57, 71, 73]
       var startVertex: [CGPoint] = [] //[7, 23, 39, 55, 71]
       var endVertex: [CGPoint] = [] //[57, 73, 9, 25, 41]
       var tempEndVertex: [CGPoint] = []
       //Skip 50
       //Cheat sheet arrows: 7-> 57 , 55 ->25, 23 -> 73, 71 -> 41, 39 -> 9
       var vertexArray: [CGPoint] = []
       
       for side in 0 ..< (sidesPoly) {
           if vertexIWant.contains(side) {
               let x = center.x + CGFloat(cos(Double(side) * anglePoly)) * CGFloat (radiusPoly)
               let y = center.y + CGFloat(sin(Double(side) * anglePoly)) * CGFloat(radiusPoly)
               let vertexPoint = CGPoint( x: x, y: y)
               vertexArray.append(vertexPoint)
           }
       }
       for index in 0 ..< vertexArray.count {
           if index.isMultiple(of: 2) || index == 0 {
               startVertex.append(vertexArray[index])
           } else {
               if index < 7 {
                   tempEndVertex.append(vertexArray[index]) //[9, 25, 41]
               } else {
                   endVertex.append(vertexArray[index]) //[57, 73]
               }
           }
       }
       
       endVertex += tempEndVertex
       
       for i in 0..<startVertex.count {
           path.move(to: startVertex[i])
           path.addLine(to: endVertex[i])
       }

    
       //Draw Pentagon
//       for side in 0 ..< (sidesPenta + 1) {
//           
//           let x = center.x + CGFloat(cos(Double(side) * angle)) * CGFloat (radius)
//           let y = center.y + CGFloat(sin(Double(side) * angle)) * CGFloat(radius)
//           
//           let vertexPoint = CGPoint( x: x, y: y)
//           
//           if (side == 0) {
//               startPoint = vertexPoint
//               path.move(to: startPoint )
//           }
//           else {
//               path.addLine(to: vertexPoint)
//           }
//       }
       
        return path
  }
}

struct Pentagram : Shape {
   var sides = 5

   func path(in rect : CGRect ) -> Path{
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = rect.width / 2

       //get angle in radians, then double it because we want to skip the first vertex and go to the next
        let angle = Double.pi * 2 / Double(sides) * 2
        var path = Path()
        var startPoint = CGPoint(x: 0, y: 0)
        
       for side in 0 ..< (sides + 1) {
           
           let x = center.x + CGFloat(cos(Double(side) * angle)) * CGFloat (radius)
           let y = center.y + CGFloat(sin(Double(side) * angle)) * CGFloat(radius)
           
           let vertexPoint = CGPoint( x: x, y: y)
           
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
            
            //Text("Drawing practice")
//            Arrow()
//                .stroke(.black, style: StrokeStyle(lineWidth: 3, lineJoin: .miter))
            Polygon()
                .stroke(.black, style: StrokeStyle(lineWidth: 1, lineJoin: .miter))
                .rotationEffect(Angle(degrees: 17))
            Pentagram()
                .stroke(.black, style: StrokeStyle(lineWidth: 3, lineJoin: .miter))
                .rotationEffect(Angle(degrees: -17))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
