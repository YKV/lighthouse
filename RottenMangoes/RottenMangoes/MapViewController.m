//
//  MapViewController.m
//  RottenMangoes
//
//  Created by Yevhen Kim on 2016-07-19.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "MapViewController.h"
#import "DetailViewController.h"
#import "Movie.h"
#import "Theater.h"

@import CoreLocation;
@import MapKit;

@interface MapViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (assign, nonatomic) BOOL shouldZoomTheaterPlace;

@property (strong, nonatomic) CLGeocoder *geocoder;
@property (strong, nonatomic) CLPlacemark *placemark;


@property (nonatomic) NSMutableArray *thaters;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.geocoder = [[CLGeocoder alloc]init];
    
    // set flag to YES so map will zoom to the region where the user is located
    self.shouldZoomTheaterPlace = YES;
    
    //allocate and initialize location manager
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    self.locationManager.distanceFilter = 50;
    
    //check if the location service is enable
    if ([CLLocationManager locationServicesEnabled]) {
        //check for the location manager authorization status
        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
            //request for authorization when user is using app
            [self.locationManager requestWhenInUseAuthorization];
            
        }
    }
    
 
}

#pragma mark - CLLocationManagerDelegate

//if authorization status changed
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    //if status is AuthorizedWhenInUse
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        //show the location of user
        self.mapView.showsUserLocation = YES;
        //show the amenities on the map
        self.mapView.showsPointsOfInterest = YES;
        //update location information everytime
        [self.locationManager startUpdatingLocation];
        
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    //initialize an location object with last updated location
    CLLocation *location = [locations lastObject];
    
    //switch the flag to NO so the user not be attach to the location point
    //so the user can be able to move on map
    if (self.shouldZoomTheaterPlace) {
        self.shouldZoomTheaterPlace = NO;
        
        //get the region where the user at
        MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(0.1, 0.1));
        //set the region on the map
        [self.mapView setRegion:region];
        
        
    }
    [self reverseGeocode:location];


}

- (void)reverseGeocode:(CLLocation *)location {
    self.geocoder  = [[CLGeocoder alloc]init];
    
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        NSLog(@"Finding an address");
        if (error == nil && [placemarks count] > 0) {
            self.placemark = [placemarks lastObject];
            NSString *postalCode = self.placemark.postalCode;
            
            NSLog(@"%@",postalCode);
        }
        else {
            NSLog(@"%@", error.debugDescription);
        }
        [self addTheaters];
        //turn off the location manager to safe the power
        //[self.locationManager stopUpdatingLocation];
    }];
    
}

//- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
//    [self.mapView setCenterCoordinate:userLocation.coordinate animated:YES];
//}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [self.locationManager stopUpdatingLocation];
    NSLog(@"error : %@", error);
    //alloc and initialize alert controller
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Connection error" message:@"Please reconnect to network" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelButton];
    //present the controller with alert message and actions
    [self presentViewController:alert animated:YES completion:nil];
}




#pragma mark - adding data to map

- (void) addTheaters {
    
    NSString *formatedURL = [NSString stringWithFormat:@"http://lighthouse-movie-showtimes.herokuapp.com/theatres.json?address=%@&movie=%@",self.placemark.postalCode,self.movie.title];
    NSString *urlString = [formatedURL stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSLog(@"%@ and %@",self.placemark.postalCode,self.movie.title);
    NSURL *api = [NSURL URLWithString:urlString];
    
    //do the request
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:api];
    NSURLSession *sharedSession = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [sharedSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSError *jsonError = nil;
            NSDictionary *parsedJson = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            NSArray *theaterArray = [parsedJson objectForKey:@"theatres"];
            if (!jsonError) {
                NSMutableArray *theaters = [NSMutableArray array];
                
                for (NSDictionary *theaterDict in theaterArray) {
                    Theater *theater = [[Theater alloc]init];
                    theater.title = theaterDict[@"name"];
                    theater.subtitle = theaterDict[@"address"];
                    theater.coordinate = CLLocationCoordinate2DMake([theaterDict[@"lat"] doubleValue], [theaterDict[@"lng"] doubleValue]);

                    [self.mapView addAnnotation:theater];
                    [theaters addObject:theater];
                }
                
                self.thaters = theaters;
                
                
                // go to the main thread and reload map with
                //passed annotation and data
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.mapView reloadInputViews];
                });
            }
            else {
                NSLog(@"Request error: %@", error.localizedDescription);
            }
        }
    }];
    
    [dataTask resume];
}


#pragma mark - MKMapViewDelegate

//- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
//    if (annotation == mapView.userLocation) {
//        return nil;
//    }
//    
//    MKAnnotationView *theaterView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"Theater"];
//    if (!theaterView) {
//        theaterView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"Theater"];
//        
//    }
//    return theaterView;
//}


@end

