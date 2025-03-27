//
//  Modo1.swift
//  Desafio2
//
//  Created by Turma01-28 on 21/03/25.
//

import SwiftUI

struct Modo1: View {
    var body: some View {
        ZStack{
            Color.black.opacity(0.8)
                .ignoresSafeArea()
            VStack {
                Text("Modo 1")
                    .padding()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundStyle(.white)
                            
                Spacer()
                
                VStack {
                    Text("Nome: Tiago")
                    Text("Sobrenome: Pereira")
                }
                .padding(EdgeInsets(top: 50, leading: 50, bottom: 50, trailing: 50))
                .font(.headline)
                .background(.pink.opacity(0.8))
                .clipShape(.buttonBorder)
                .foregroundStyle(.white)
                
                Spacer()
            }
        }
    }
}

#Preview {
    Modo1()
}
