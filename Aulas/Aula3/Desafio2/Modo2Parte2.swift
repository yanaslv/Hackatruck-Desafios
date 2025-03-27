//
//  Modo2Parte2.swift
//  Desafio2
//
//  Created by Turma01-28 on 21/03/25.
//

import SwiftUI

struct Modo2Parte2: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.opacity(0.8)
                    .ignoresSafeArea()
                VStack {
                    Text("Modo 2")
                        .padding()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Text("Volte,\nTiago")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(.pink.opacity(0.8))
                    .clipShape(.buttonBorder)
                    .foregroundStyle(.white)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    Modo2Parte2()
}
