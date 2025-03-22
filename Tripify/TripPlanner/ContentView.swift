//
//  ContentView.swift
//  TripPlanner
//
//  Created by ndpate11 on 4/13/23.
//

import SwiftUI
import CoreData

struct ContentView: View
{
    @Environment(\.managedObjectContext) private var viewContext

  /*  @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Trip.name, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Trip>*/

    var body: some View
    {
        NavigationView
        {
            GeometryReader
            { geometry in
                ZStack(alignment: .top)
                {
        
                    Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height / 4)
                    .clipped()
                }.ignoresSafeArea(edges: .top)
         
                VStack
                {
             
                    Spacer()
                    Spacer()
                    //Spacer()
                
                    
                
                    HStack
                    {
                        Spacer()
                        Text("Our Suggestions")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        Spacer()
                    }
                   // Spacer()
               
                    Image("NY")
                    .resizable()
                    .frame(width:300,height: 200)
                    .scaledToFit()
                   
              
                    Text("New York City")
                    //Spacer()
                    Image("SF")
                    .resizable()
                    .frame(width:300, height: 200)
                
                    Text("San Franscisco")
                    Spacer()
                 
                
                
                    
    
                
                }
                VStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    HStack
                    {
                        NavigationLink(destination: MenuView())
                        {
                            Spacer()
                            Text("Let's start Planning your Trip")
                            .foregroundColor(.white)
                            .frame(width: 300, height: 15, alignment: .center)
                            .padding()
                            .background(Color.teal)
                            .cornerRadius(30)
                            Spacer()
                        }
                    }
                   
                }
    
            
            }
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
