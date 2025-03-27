//
//  SheetView.swift
//  Desafio2
//
//  Created by Turma01-28 on 21/03/25.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Color.black.opacity(0.8)
                .ignoresSafeArea()
            VStack {
                Text("SheetView")
                    .padding()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundStyle(.white)
                            
                Spacer()
                
                Button("Nome: Tiago\nSobrenome: Pereira") {
                    dismiss()
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
    SheetView()
}
