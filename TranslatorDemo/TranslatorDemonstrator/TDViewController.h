//
//  TDViewController.h
//  TranslatorDemonstrator
//
//  Created by Magnus Løberg on 24.04.12.
//  Copyright (c) 2012 UiB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface TDViewController : UIViewController
{
    IBOutlet UIButton *speak0;
    IBOutlet UIButton *speak1;
    IBOutlet UIButton *speak2;
    
    IBOutlet UIButton *languageAlbansk;
    IBOutlet UIButton *languageAmharisk;
    IBOutlet UIButton *languageArabisk;
    IBOutlet UIButton *languageFarsi;
    IBOutlet UIButton *languageKinesisk;
    IBOutlet UIButton *languageSamisk;
    IBOutlet UIButton *languageRumensk;
    IBOutlet UIButton *languageRussisk;
    IBOutlet UIButton *languageSomali;
    IBOutlet UIButton *languageThai;
    IBOutlet UIButton *languageTyrkisk;
    IBOutlet UIButton *languageUrdu;
    
    IBOutlet UIButton *buttonBalashandtering;
    IBOutlet UIButton *buttonTiltak;
    IBOutlet UIButton *buttonSykdomshistorie;
    IBOutlet UIButton *buttonVitalfunksjoner;
    IBOutlet UIButton *buttonSymptomogdiagnose;
    IBOutlet UIButton *buttonAdiministrativedata;
        
    NSMutableArray *russiskSkrift;
    NSMutableArray *rumenskSkrift;
    NSMutableArray *arabiskSkrift;
    NSMutableArray *norskSkrift;     
    NSMutableArray *russiskTale;
    NSMutableArray *rumenskTale;
    NSMutableArray *arabiskTale;
    
    NSMutableArray *currentLanguageWritten;
    NSMutableArray *currentLanguageSpoken;
    int currentSentence;
    
    AVAudioPlayer  *player;
    
    IBOutlet UILabel *norskSetning0;
    IBOutlet UILabel *norskSetning1;
    IBOutlet UILabel *norskSetning2;
    
    IBOutlet UILabel *oversattSetning0;
    IBOutlet UILabel *oversattSetning1;
    IBOutlet UILabel *oversattSetning2;
    
    NSURL *oversattSetningTaleURL0;
    NSURL *oversattSetningTaleURL1;
    NSURL *oversattSetningTaleURL2;
}

@property (nonatomic, retain) AVAudioPlayer *player;

- (void)update;

- (IBAction)languageRussiskPressed:(id)sender;
- (IBAction)languageRumenskPressed:(id)sender;
- (IBAction)languageArabiskPressed:(id)sender;

- (IBAction)buttonBalashandteringPressed:(id)sender;
- (IBAction)buttonTiltakPressed         :(id)sender;
- (IBAction)buttonSykdomshistoriePressed:(id)sender;

- (IBAction)snakk0:(id)sender;
- (IBAction)snakk1:(id)sender;
- (IBAction)snakk2:(id)sender;

@end
