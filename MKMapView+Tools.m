//
//  MKMapView+Tools.m
//  Turn By Turn
//
//  Created by Romain Rivollier on 05/12/14.
//  Copyright (c) 2014 Transcovo. All rights reserved.
//

#import "MKMapView+Tools.h"

@implementation MKMapView (Tools)

- (double)distanceOfPoint:(MKMapPoint)pt toPolyline:(MKPolyline *)poly
{
    double distance = MAXFLOAT;
    
    // We compare the point (pt) given in parameter with all points contain into the polyline
    for (int n = 0; n < poly.pointCount - 1; ++n)
    {
        MKMapPoint ptA = poly.points[n];
        MKMapPoint ptB = poly.points[n + 1];
        
        double xDelta = ptB.x - ptA.x;
        double yDelta = ptB.y - ptA.y;
        
        //The X and Y delta cannot be equal
        if (xDelta != 0.0 && yDelta != 0.0)
        {
            double u = ((pt.x - ptA.x) * xDelta + (pt.y - ptA.y) * yDelta) / (xDelta * xDelta + yDelta * yDelta);
            
            MKMapPoint ptClosest;
            
            if (u < 0.0)
            {
                ptClosest = ptA;
            }
            else if (u > 1.0)
            {
                ptClosest = ptB;
            }
            else
            {
                ptClosest = MKMapPointMake(ptA.x + u * xDelta, ptA.y + u * yDelta);
            }
            
            distance = MIN(distance, MKMetersBetweenMapPoints(ptClosest, pt));
        }
    }
    
    return distance;
}

- (CLLocationCoordinate2D*)convertPolylineToCoordinates:(MKPolyline*)polyline
{
    NSUInteger pointCount = polyline.pointCount;
    
    //allocate a C array to hold this many points/coordinates...
    CLLocationCoordinate2D *routeCoordinates = malloc(pointCount * sizeof(CLLocationCoordinate2D));
    
    //get the coordinates (all of them)...
    [polyline getCoordinates:routeCoordinates range:NSMakeRange(0, pointCount)];
    
    
#if DEBUG
    //this part just shows how to use the results
    NSLog(@"DEBUG route pointCount = %@", @(pointCount));
    
    for (int c=0; c < pointCount; c++)
    {
        NSLog(@"DEBUG routeCoordinates[%d] = %f, %f", c, routeCoordinates[c].latitude, routeCoordinates[c].longitude);
    }
#endif
    
    //free the memory used by the C array when done with it...
    return routeCoordinates;
}

@end
