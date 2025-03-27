//
//  ContentView.swift
//  Aula5
//
//  Created by Turma01-28 on 25/03/25.
//

import SwiftUI
import MapKit

struct Location: Hashable {
    let nome: String
    let foto: String
    //let coordenadas: Double
    let descricao: String
    let latitude: Double
    let longitude: Double
}

var arrayLocation = [
    Location(nome: "Cristo Redentor",
             foto: "https://content.skyscnr.com/m/77c4403701e219f6/original/Christus-de-Verlosser-Rio-de-Janeiro.jpg?resize=1000px:667px",
             descricao: "A imagem de Jesus Cristo de braços abertos no Rio de Janeiro faz jus ao título de uma das 7 Maravilhas do Mundo Moderno. Inaugurado em 1931, levou 5 anos para ser construído, e hoje é um dos cartões postais mais conhecidos do Brasil. Localizada a 709 metros acima do nível do mar, a construção tem 38 metros de comprimento, sendo que 8 metros compõem apenas o pedestal. É a obra mais jovem entre as demais maravilhas do mundo moderno.",
             latitude: -22.9516667,
            longitude: -43.21027777777778),
    Location(nome: "Machu Picchu",
             foto: "https://content.skyscnr.com/m/30509f0430fac384/original/GettyImages-515885778.jpg?resize=2560px:1707px",
             descricao: "Machu Picchu é uma das mais prestigiadas heranças do povo Inca, um dos mais intrigantes da história. Descoberta em 1911, a Cidade Perdida dos Incas fica no topo de uma montanha com 2400 metros de altitude, no vale do rio Urubamba. Construída no século 15, conta hoje com apenas 30% de sua construção original. O restante foi todo reconstruído, permitindo uma pequena ideia do que seria toda a sua grandiosidade, caso a obra permanecesse intacta até hoje.",
             latitude: -13.1630556,
            longitude: -72.54472222222222),
    Location(nome: "Chichén Itzá",
             foto: "https://content.skyscnr.com/m/6985e714018decc4/original/GettyImages-160677545.jpg?resize=2560px:1697px",
             descricao: "A civilização maia nos presenteou com legados arquitetônicos, artísticos, matemáticos, astronômicos e sociais. Chichén Itzá, escolhida como uma das Maravilhas do Mundo Moderno, era o centro político e econômico desse povo. A pirâmide de Kukulkan (provavelmente o ícone mais importante e popular de todos os templos Maias), a Praça das Mil Colunas, o Campo de Jogos dos Prisioneiros e o Templo de Chac Mool também são exemplos da grandiosidade e dedicação deste povo – e são atrações que podem ser visitadas dentro desse mesmo sítio arqueológico.",
             latitude: 20.6788889,
            longitude: -88.56805555555555),
    Location(nome: "Coliseu",
             foto: "https://content.skyscnr.com/m/666ed13d236d17e4/original/GettyImages-158762142_doc.jpg?resize=2560px:1707px",
             descricao: "Símbolo do Império Romano, o Coliseu é o mais famoso anfiteatro do mundo e uma das obras arquitetônicas mais importantes da história da humanidade. Com cerca de 2 mil anos de história, foi palco de lutas de gladiadores a obras teatrais. Atualmente, é uma das 7 Maravilhas do Mundo Moderno mais disputadas entre os visitantes, e provavelmente um dos atrativos responsáveis por manter a Itália entre os países mais visitados do mundo.",
             latitude: 41.89,
            longitude: 12.492222222222221),
    Location(nome: "Ruínas de Petra",
             foto: "https://content.skyscnr.com/m/331ff8c93cb6436d/original/shutterstock_1403691857.jpg?resize=2560px:1704px",
             descricao: "Inteiramente esculpida em arenito, as Ruínas de Petra, que sobreviveram aos terremotos e à corrosão natural do tempo, são donas de uma beleza única. Não à toa, foram escolhidas como uma das 7 Maravilhas do Mundo Moderno. Localizada entre as montanhas que formam o flanco leste de Wadi Araba, vale que vai do Mar Morto ao Golfo de Aqaba, Petra foi habitada aproximadamente em 1200 a.C. pelos Nabateus, responsáveis pela bela arquitetura da cidade.",
             latitude: 30.3283333,
            longitude: 35.44416666666666),
    Location(nome: "Taj Mahal",
             foto: "https://content.skyscnr.com/m/31607db31d218a75/original/GettyImages-467448870.jpg?resize=2560px:1579px",
             descricao: "Principal monumento da Índia, o Taj Mahal é um impressionante mausoléu. Construído entre 1630 e 1652, cerca de 22 mil homens trabalharam durante as obras. Localizado em Agra, o monumento foi feito em homenagem à Aryumand Banu Begam, a esposa preferida do imperador Shah Jahan, que faleceu dando à luz ao seu 14º filho. O nome da construção foi inspirado no apelido carinhoso que o imperador deu a sua amada, Mumtaz Mahal, e significa “joia do palácio”. Taj Mahal foi erguido sob o túmulo de Aryumand Banu Begam e unido ao rio Yamuna. A criação chama a atenção ainda por ser adornada com pedras semipreciosas em todo seu interior e com fios de ouro em sua cúpula.",
             latitude: 27.175,
            longitude: 78.04194444444444),
    Location(nome: "Grande Muralha da China",
             foto: "https://content.skyscnr.com/m/60a05d2d4cf66a2f/original/GettyImages-125999684_doc.jpg?resize=2560px:1713px",
             descricao: "Idealizada e construída ao longo de várias dinastias chinesas, a Grande Muralha da China começou a ser feita em 220 a.C., por ordem do primeiro imperador chinês Qin Shihuang, da dinastia Qin. A ideia da obra era oferecer proteção das invasões vindas do Norte. Com o passar do tempo, a Grande Muralha acabou se tornando uma das construções mais icônicas da história da humanidade e uma das 7 Maravilhas do Mundo Moderno.",
             latitude: 40.38142858560813,
            longitude: 116.58121754205813)
]

struct ContentView: View {
    @State private var showingSheet = false
    @State private var localSelecionado : Location = Location(nome: "", foto: "", descricao: "", latitude: 0, longitude: 0)
    @State private var position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 30.3283333, longitude: 35.44416666666666),span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100)))
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                VStack {
                    Map(position: $position) {
                        ForEach(arrayLocation, id: \.self) { local in
                            Annotation(local.nome, coordinate: CLLocationCoordinate2D(latitude: local.latitude, longitude: local.longitude)) {
                                Button {
                                    showingSheet.toggle()
                                    localSelecionado = local
                                }
                                label: {
                                    Image(systemName: "mappin")
                                        .padding(7)
                                }
                                .sheet(isPresented: $showingSheet) {
                                    SheetView(local: $localSelecionado)
                                }
                                    .background(.black.opacity(0.8))
                                    .clipShape(Circle())
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                }
                VStack {
                    Picker("7 Maravilhas do mundo moderno", selection: $localSelecionado) {
                        ForEach(arrayLocation, id: \.self) { local in
                            Text(local.nome)
                        }
                    }
                    .frame(width: 300, height: 50)
                    .background(.yellow)
                    .cornerRadius(10)
                    .padding(10)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .tint(.black)
                    .onChange(of: localSelecionado) {
                        position = MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: localSelecionado.latitude, longitude: localSelecionado.longitude),
                                span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100)))
                    }
                    
                    Spacer()
                    
                    Button("7 Maravilhas do Mundo Moderno") {
                        position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 30.3283333, longitude: 35.44416666666666),span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100)))
                    }
                    .frame(width: 300, height: 50)
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
    ContentView()
}
