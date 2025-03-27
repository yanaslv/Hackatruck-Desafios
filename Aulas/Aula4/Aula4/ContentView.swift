//
//  ContentView.swift
//  Aula4
//
//  Created by Turma01-28 on 24/03/25.
//

import SwiftUI

struct Song : Hashable {
    var name : String
    var artist : String
    var capa : String
}
var arrayMusicas = [
    Song(name: "I Bet On Losing Dogs", artist: "Mitski", capa: "https://i.scdn.co/image/ab67616d0000b27351630f0f26aff5bbf9e10835"),
    Song(name: "Brand New City", artist: "Mitski", capa: "https://i.scdn.co/image/ab67616d0000b27318bbdba0da26e4ae050fb1b8"),
    Song(name: "Jobless Monday", artist: "Mitski", capa: "https://i.scdn.co/image/ab67616d0000b273e90db8983ebd43b776694179"),
    Song(name: "A Pearl", artist: "Mitski", capa: "https://i.scdn.co/image/ab67616d0000b273c428f67b4a9b7e1114dfc117"),
    Song(name: "Liquid Smooth", artist: "Mitski", capa: "https://i.scdn.co/image/ab67616d0000b27318bbdba0da26e4ae050fb1b8"),
    Song(name: "Working for the Knife", artist: "Mitski", capa: "https://i.scdn.co/image/ab67616d00001e02d8041a531487d0e0e4cfb41f"),
    Song(name: "Class of 2013", artist: "Mitski", capa: "https://i.scdn.co/image/ab67616d0000b27334b5e51adeea6f1aa2285ce3"),
    Song(name: "I Want You", artist: "Mitski", capa: "https://i.scdn.co/image/ab67616d0000b27334b5e51adeea6f1aa2285ce3"),
    Song(name: "Real Men", artist: "Mitski", capa: "https://i.scdn.co/image/ab67616d0000b27318bbdba0da26e4ae050fb1b8"),
    Song(name: "Last Words of a Shooting Star", artist: "Mitski", capa: "https://i.scdn.co/image/ab67616d0000b273e90db8983ebd43b776694179")
]

var arrayRecomendados = [
    Song(name: "My Love Mine All Mine", artist: "Mitski", capa: "https://i.scdn.co/image/ab67616d0000b27334f21d3047d85440dfa37f10"),
    Song(name: "Washing Machine Heart", artist: "Mitski", capa: "https://i.scdn.co/image/ab67616d0000b273c428f67b4a9b7e1114dfc117"),
    Song(name: "Nobody", artist: "Mitski", capa: "https://i.scdn.co/image/ab67616d0000b273c428f67b4a9b7e1114dfc117"),
    Song(name: "Fist Love/Late Spring", artist: "Mitski", capa: "https://i.scdn.co/image/ab67616d0000b273e90db8983ebd43b776694179")
]

struct ContentView: View {
    var body: some View {
        NavigationStack {
                ZStack {
                    LinearGradient(colors: [.orange, .black, .black], startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                ScrollView {
                    VStack {
                        Image("capa")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .padding()
                        
                        VStack {
                            Text("HackaFM")
                                .font(.title)
                                .bold()
                            HStack {
                                AsyncImage(url: URL(string: "https://portais.univasf.edu.br/imagens-noticias/WhatsAppImage20240910at17.01.29.jpeg")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 35, height: 35)
                                Text("HackaSong")
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack {
                            ForEach(arrayMusicas, id: \.self) {
                                musica in
                                HStack {
                                    NavigationLink(destination: InfoView(recebeMusica: musica)) {
                                        AsyncImage(url: URL(string: musica.capa)) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 60, height: 60)
                                        VStack (alignment: .leading) {
                                            Text(musica.name)
                                            Text(musica.artist)
                                        }
                                        Spacer()
                                        Image(systemName: "ellipsis")
                                    }
                                }
                            }
                        }
                        
                        VStack {
                            Text("Sugeridos")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }
                        .padding([.top], 90)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(arrayRecomendados, id: \.self) { musica in
                                NavigationLink(destination: InfoView(recebeMusica: musica)) {
                                    VStack {
                                            AsyncImage(url: URL(string: musica.capa)) { image in
                                                image.resizable()
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .frame(width: 200, height: 200)
                                            Text(musica.name)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
