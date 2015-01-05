//
//  ViewController.h
//  Turn By Turn
//
//  Created by Romain Rivollier on 01/12/14.
//  Copyright (c) 2014 Transcovo. All rights reserved.
//

@import UIKit;
@import CoreLocation;

#import "MKMapView+Tools.h"
//CLLocationManagerDelegate est le protocole qui permet d'avoir des information de géolocalisation
@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLGeocoder *geocoder;
}
@property (nonatomic, strong) CLGeocoder *geocoder;
@property (weak, nonatomic) IBOutlet MKMapView *mapview;
@property (weak, nonatomic) IBOutlet UITextField *recherche;

@end

