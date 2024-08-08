//
//  SwiftUIView.swift
//  slot_machine
//
//  Created by Keshav kumar on 04/08/24.
//

import SwiftUI

struct Hexagonal: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {path in
            let p1 = CGPoint(x: 0, y: 20)
            let p2 = CGPoint(x: 0, y: rect.height-20)
            let p3 = CGPoint(x: (rect.width)/2, y: rect.height)
            let p4 = CGPoint(x: rect.width, y: rect.height-20)
            let p5 = CGPoint(x: rect.width, y: 20)
            let p6 = CGPoint(x: rect.width/2, y: 0)
            
            path.move(to: p6)
            //connecting to all the points
            path.addArc(tangent1End: p1, tangent2End: p2, radius: 20)
            path.addArc(tangent1End: p2, tangent2End: p3, radius: 20)
            path.addArc(tangent1End: p3, tangent2End: p4, radius: 20)
            path.addArc(tangent1End: p4, tangent2End: p5, radius: 20)
            path.addArc(tangent1End: p5, tangent2End: p6, radius: 20)
            path.addArc(tangent1End: p6, tangent2End: p1, radius: 20)
            // connection p6 to p1 was not required actually , but in case !
            // if radius is put to 0 , then no curveness will be there !
        }
    }
}

#Preview {
    Hexagonal()
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
}

