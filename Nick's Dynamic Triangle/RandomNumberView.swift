//
//  RandomNumberView.swift
//  Nick's Dynamic Triangle
//
//  Created by Nicholas Gramenos on 3/3/23.
//

import SwiftUI


struct RandomNumberView: View {
    @State private var n = Int.random(in: 1...10)
    
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Random number: \(n)")
                    .padding()
                    .font(.title)
                Spacer()
                rowsOfOnes(n: n)
                Spacer()
                Button("Generate new number") {
                    n = Int.random(in: 1...10)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
            }
            .background(Color.yellow.opacity(0.2))
            .scaledToFill()
        }
    }
        
        func rowOfOnes(count: Int) -> some View {
            HStack(spacing: 0) {
                Text("1")
                    .fontWeight(.bold)
                    .frame(width: 20)
                ForEach(1..<count, id: \.self) { _ in
                    Text(" 1")
//                        .fontWeight(.bold)
                        .frame(width: 20)
                }
            }
        }
        
        func rowsOfOnes(n: Int) -> some View {
            VStack(alignment: .leading) {
                ForEach(1...n, id: \.self) { i in
                    rowOfOnes(count: i)
                }
                ForEach(1..<n, id: \.self) { i in
                    rowOfOnes(count: n - i)
                }
            }
        }
    
    
    
   
    struct RandomNumberView_Previews: PreviewProvider {
        static var previews: some View {
            RandomNumberView()
        }
    }
}
