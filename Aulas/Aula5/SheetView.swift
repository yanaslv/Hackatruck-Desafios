//
//  SheetView.swift
//  Aula5
//
//  Created by Turma01-28 on 25/03/25.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var local : Location
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.5)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: local.foto)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 200, height: 200)
                    .padding()
                    
                    Text(local.nome)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .foregroundStyle(.black)
                    
                    Text(local.descricao)
                        .padding()
                        .background(.brown.opacity(0.8))
                        .padding([.leading, .trailing], 20)
                    
                    Button("Voltar ao mapa"){
                        dismiss()
                    }
                    .frame(width: 300, height: 50)
                    .foregroundStyle(.black)
                    .background(.yellow)
                    .cornerRadius(10)
                    .padding(10)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .tint(.black)
                }
            }
        }
    }
}

#Preview {
    SheetView(local: .constant(Location(nome: "", foto: "", descricao: "", latitude: 0, longitude: 0)))
}
