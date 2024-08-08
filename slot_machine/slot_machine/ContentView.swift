//
//  ContentView.swift
//  slot_machine
//
//  Created by Keshav kumar on 04/08/24.
//

import SwiftUI

struct Hexagon: Shape {
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

enum Choice : Int , Identifiable
{
    var id : Int
    {
        rawValue
    }
    
    case success , failure
}


struct ContentView: View
{
    /*
     we will be keeping 3 'symbols' only which will keep changing , so we will
     have higher chance of hitting a jackpot , if we will increase symbols then
     permutation will increase , and chance of hitting a jackpot will increase a
     lot.
    */
    
    @State public var symbols = [ "eating" , "happy" , "love" ]
    @State public var numbers = [ 0 , 1 , 2 ]
    @State public var counter = 0
    @State private var showingAlert : Choice?
    
    
    var body: some View
    {
        ZStack
        {
            Image("sunshine")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 80)
            {
                HStack
                {
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .orange, radius: 2, x: 0, y: 5)
                    Text("slot machine")
                        .font(.system(size:30))
                        .fontWeight(.black)
                        .shadow(color: .orange, radius: 2, x: 0, y: 3)
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .orange, radius: 2, x: 0, y: 5)
                }
                // fixing whole HStack
                .frame(width: .infinity, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                VStack(spacing:30)
                {
                    // 1st line
                    HStack(spacing:40)
                    {
                        Hexagon()
                        // it should be fillabe so .fill()
                            .fill(Color.white)
                            .opacity(0.8)
                            .frame(width: 100, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .overlay(
                                Image(symbols[numbers[0]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
                            )
                        Hexagon()
                        // it should be fillabe so .fill()
                            .fill(Color.white)
                            .opacity(0.8)
                            .frame(width: 100, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .overlay(
                                Image(symbols[numbers[1]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
                            )
                    }
                    // 2nd line
                    HStack(spacing:40)
                    {
                        Hexagon()
                        // it should be fillabe so .fill()
                            .fill(Color.white)
                            .opacity(0.8)
                            .frame(width: 100, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .overlay(
                                Image(symbols[numbers[2]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
                            )
                    }
                    // 3rd line
                    HStack(spacing:40)
                    {
                        Hexagon()
                        // it should be fillabe so .fill()
                            .fill(Color.white)
                            .opacity(0.8)
                            .frame(width: 100, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .overlay(
                                Image(symbols[numbers[0]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
                            )
                        Hexagon()
                        // it should be fillabe so .fill()
                            .fill(Color.white)
                            .opacity(0.8)
                            .frame(width: 100, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .overlay(
                                Image(symbols[numbers[1]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
                            )
                    }
                    Button
                    {
                        self.numbers[0] = Int.random(in: 0...self.symbols.count-1)
                        self.numbers[1] = Int.random(in: 0...self.symbols.count-1)
                        self.numbers[2] = Int.random(in: 0...self.symbols.count-1)
                        
                        /*
                         ->now , i don't want people to keep trying , there should
                         be a minimum number of attempt after that the game ends.
                         */
                        
                        counter += 1
                        
                        // winning logic
                        if(self.numbers[0]==self.numbers[1] && self.numbers[1]==self.numbers[2])
                        {
                            self.showingAlert = .success
                            counter = 0
                        }
                        //losing logic
                        if(counter > 5)
                        {
                            self.showingAlert = .failure // failure is enum , so dot.
                            counter = 0
                        }
                    }
                    label :
                    {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("color_yellow"))
                            .overlay(
                                Text("Spin")
                                    .fontWeight(.black)
                                    .font(.title2)
                            )
                            .foregroundColor(.black)
                            .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .shadow(color: .gray, radius: 5, x: 1, y: 4)
                    }
                }
            }
            // choose(item , alert) and press 'tab' and then 'enter'
            // in place of 'Binding<Identifiable>' put '$showingAlert'
            // in place of 'Identifiable' put 'alert -> Alert'
            .alert(item: $showingAlert) { alert -> Alert in
                switch alert
                {
                case .success :
                    return Alert(title: Text("Yayy! you hit the jackpot"), message: Text("Born with the luck"), dismissButton: .cancel())
                case .failure :
                    return Alert(title: Text("Ooops!"), message: Text("Better luck next time"), dismissButton: .cancel())
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
