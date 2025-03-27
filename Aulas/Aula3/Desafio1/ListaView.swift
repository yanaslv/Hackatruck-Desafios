//
//  ListaView.swift
//  Desafio1
//
//  Created by Turma01-28 on 21/03/25.
//

import SwiftUI

struct ListaView: View {
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
                .opacity(0.2)
            NavigationStack {
                List {
                    NavigationLink {
                        RosaView()
                    } label: {
                        HStack{
                            Text("Item")
                            Spacer()
                            Image(systemName: "paintbrush")
                        }
                    }
                    NavigationLink {
                        AzulView()
                    } label: {
                        HStack{
                            Text("Item")
                            Spacer()
                            Image(systemName: "paintbrush.pointed")
                        }
                    }
                    NavigationLink {
                        CinzaView()
                    } label: {
                        HStack{
                            Text("Item")
                            Spacer()
                            Image(systemName: "paintpalette")
                        }
                    }
                }
                .navigationTitle("List")
            }
        }
        .tint(.black)
    }
}

#Preview {
    ListaView()
}
