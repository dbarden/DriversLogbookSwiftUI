//
//  TripDetail.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 18.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI
import MapKit

//shows details of a single trip selected from the list
struct TripDetail: View {
    
    
    //Save Button
    @State var isActive: Bool = false
    
    //Tabbar Try
    var tabbaritem = TabBar()
    
    //Trip Instance for data
    @State var trip: Trip
    
    //Radio Button Selected
    
    
    
    //UI starts here
    var body: some View {
        
        //NavigationBar: NavigationBarBackButton, no title
        NavigationView {
            
            ScrollView {
                
                VStack (alignment: .leading) {
                    
                    
                    
                    //Spacer to separate NavBar and main elements
                    Spacer().padding(.top, 60)
                    
                    //Date and Aktive Days
                    HStack {
                        Text(trip.date)
                            .font(.custom("PorscheNext-SemiBold", size: 20))
                        if trip.activeDays >= 3 {
                            Image("active")
                                .padding(.leading, 52)
                            
                        } else if trip.activeDays >= 0 {
                            Image("active3")
                                .padding(.leading, 52)
                            
                        } else {
                            Image("active0")
                                .padding(.leading, 52)
                            
                        }
                        Text("Noch \(trip.activeDays) Tage bearbeitbar")
                            .font(.custom("PorscheNext-Thin", size: 12))
                            .foregroundColor(Color.init("FontLight"))
                        
                    }.padding(.top, -20)
                    
                    //Card Design from Start to Category
                    ZStack {
                        //the Card
                        BackgroundPrivateMap()
                        
                        //Card elements
                        VStack (alignment: .leading) {
                            //Top part: start and end and distance
                            Text("Start")
                                .bold()
                            Text(trip.startAddress)
                            // TODO: add start milage
                            Text("Ziel")
                                .bold()
                                .padding(.top, 20)
                            Text(trip.endAddress)
                            // TODO: add end milage
                            
                            HStack {
                                Image("distance")
                                Text("\(trip.distance) km")
                            }
                            
                            MapView(trip: trip).frame(width: 280, height: 180)
                            
                            //Divider
                            Image("Line")
                            //.padding(.top, 10)
                            //.padding(.bottom, 10)
                            
                            //Bottom part: Category
                            Text("Fahrtkategorie")
                                .bold()
                            
                            //Radio Buttons, active: tick
                            RadioButtonGroup { selected in
                                //print("Selected item: \(selected)")
                                if selected == Category.privateTrip.rawValue {
                                    self.trip.category = Category.privateTrip.rawValue
                                }
                                
                                
                                
                            }.padding(.bottom, -10)
                            
                        }.font(.custom("PorscheNext-Regular", size: 16))
                            .frame(width: 275, height: 565)
                            .padding(.top, -25)
                    }.padding(.top, -10)
                    
                    //Save Button
                    NavigationLink(destination: TabBar(selectedTab: 1)) {
                        ZStack{
                            Rectangle()
                            .frame(width: 295, height: 48)
                                .background(Color.init("PorscheRot"))
                                .foregroundColor(Color.init("PorscheRot"))
                            Text("Fahrt speichern")
                                .foregroundColor(.white)
                            .font(.custom("PorscheNext-Regular", size: 16))
                        }
                        
                        .padding(.top, 5)
                        .padding(.bottom, 100)
                        
                    }
                    
                    
                }
                .padding()
                    .navigationBarTitle(" ", displayMode: .inline)
            
            }
        }.padding(-40)
        
        
    }
}

struct TripDetail_Previews: PreviewProvider {
    static var previews: some View {
        TripDetail(trip: tripData[0])
    }
}
