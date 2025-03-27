//
//  InfoView.swift
//  Aula4
//
//  Created by Turma01-28 on 24/03/25.
//

import SwiftUI

struct InfoView: View {
    @State var recebeMusica : Song = Song(name: "Nome", artist: "Artista", capa: "https://portais.univasf.edu.br/imagens-noticias/WhatsAppImage20240910at17.01.29.jpeg")
    var body: some View {
        ZStack {
            LinearGradient(colors: [.orange, .black, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Spacer()
                AsyncImage(url: URL(string: recebeMusica.capa)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                .padding(0)
                VStack {
                    Text(recebeMusica.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(0)
                    Text(recebeMusica.artist)
                        .font(.headline)
                        .padding(0)
                }
                
                Spacer()
                
                HStack {
                    Image(systemName: "shuffle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 25)
                    Spacer()
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                    Spacer()
                    Image(systemName: "play.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                    Spacer()
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                    Spacer()
                    Image(systemName: "repeat")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 25)
                }
                .padding(10)
                Spacer()
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    InfoView()
}
