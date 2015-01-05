//
//  MKMapView+Tools.h
//  Turn By Turn
//
//  Created by Romain Rivollier on 05/12/14.
//  Copyright (c) 2014 Transcovo. All rights reserved.
//

@import MapKit;

@interface MKMapView (Tools)


/**
 *  Give the distance between an given MKMapPoint to a MKPolyline
 *
 *  @param pt   The MKMapPoint
 *  @param poly a MKPolyline
 *
 *  @return The distance in meters between the point to the polyline
 */
- (double)distanceOfPoint:(MKMapPoint)mapPoint toPolyline:(MKPolyline *)polyline;


/**
 *  Convert MKPolyline's points to an array of CLLocationCoordinate2D.
 *
 *  @param polyline A MKPolyline which contains at least one point
 *
 *  @return An array of CLLocationCoordinate2D. WARNING: don't forget to free the retunred array, it's a classic C array.
 */
- (CLLocationCoordinate2D*)convertPolylineToCoordinates:(MKPolyline*)polyline;

@end
