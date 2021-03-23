//
//  MapView.swift
//  YouYou
//
//  Created by Jonathan Duong on 23/03/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    //var userPosition: CLLocationCoordinate2D
    //var userCapsule: Capsule
    //var otherCapsule: Capsule
    var capsuleAudios: [CapsuleAudio]
    @State var showCapsuleDetails: CapsuleAudio? = nil
    
    // sera appelé dés la création de la vue
    @StateObject var location: LocationHelper = LocationHelper(CLLocation(latitude: 48.9066, longitude: 2.4522))
    
    var body: some View {
        NavigationView {
            //        //Map Simple
            //        Map(coordinateRegion: $location.coordinates)
            //Map avec location et Interactions
            //                    Map(coordinateRegion: $location.coordinates, interactionModes: MapInteractionModes.all, showsUserLocation: true, userTrackingMode: .constant(MapUserTrackingMode.none))
            //Map avec annotations
            ZStack {
                Map(coordinateRegion: $location.coordinates, interactionModes: .all, showsUserLocation: true, userTrackingMode: .none, annotationItems: capsuleAudios, annotationContent: { lieu in
                    
                    MapAnnotation(coordinate: lieu.localisation, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                        Image(systemName: "pin.fill")
                            .foregroundColor(.red)
                            .onTapGesture {
                                showCapsuleDetails = lieu
                            }
                        //                        .alert(isPresented: $showDetails, content: {
                        //                            Alert(title: Text(lieu.name))
                        //                        })
                    }
                })
                .navigationTitle("Maps")
                .navigationBarItems(trailing: Toggle(isOn: $location.shouldTrack, label: {
                    Image(systemName: (location.shouldTrack) ? "location" : "location.slash")
                }))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    showCapsuleDetails = nil
                }
                if let lieu = showCapsuleDetails {
                    CapsuleRaw(cetteCapsule: lieu)   
                }
            }
        }
    }
}
    
    
    struct MapView_Previews: PreviewProvider {
        static var previews: some View {
            MapView(capsuleAudios: getLocations())
        }
    }

