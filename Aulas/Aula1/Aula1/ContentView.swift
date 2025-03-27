//
//  ContentView.swift
//  Aula1
//
//  Created by Turma01-28 on 19/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.red)
                    .padding()
                Spacer()
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.blue)
                    .padding()
            }
            
            Spacer()
            
            HStack {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.green)
                    .padding()
                Spacer()
                
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.yellow)
                    .padding()

            }
        }
    }
}

#Preview {
    ContentView()
}
