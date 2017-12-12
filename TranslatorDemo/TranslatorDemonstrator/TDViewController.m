//
//  TDViewController.m
//  TranslatorDemonstrator
//
//  Created by Magnus Løberg on 24.04.12.
//  Copyright (c) 2012 UiB. All rights reserved.
//

#import "TDViewController.h"

@interface TDViewController ()

@end

@implementation TDViewController

@synthesize player;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    NSLog(@"initWithNibName");
   
    // SKRIFT
    norskSkrift   = [[NSMutableArray alloc] init];
    russiskSkrift = [[NSMutableArray alloc] init];
    rumenskSkrift = [[NSMutableArray alloc] init];
    arabiskSkrift = [[NSMutableArray alloc] init];
    
    [norskSkrift addObject:@"Klem hendene mine."];
    [norskSkrift addObject:@"Har de smerter?"];
    [norskSkrift addObject:@"Jeg skal sette en sprøyte."];
    
    [russiskSkrift addObject:@"Сожмите мои руки"];
    [russiskSkrift addObject:@"Вы чувствуете боль?"];
    [russiskSkrift addObject:@"Мне нужно сделать вам укол."];
    
    [rumenskSkrift addObject:@"Strângeţi-mă de mâini"];
    [rumenskSkrift addObject:@"Aveţi dureri?"];
    [rumenskSkrift addObject:@"Trebuie să vă fac o injecţie."];
    
    [arabiskSkrift addObject:@"اضغط / اضغطي على يدي"];
    [arabiskSkrift addObject:@"هل تشعر بالألم؟"];
    [arabiskSkrift addObject:@"احتاج الى اعطائك حقنة"];

    // TALE
    russiskTale = [[NSMutableArray alloc] init];
    rumenskTale = [[NSMutableArray alloc] init];
    arabiskTale = [[NSMutableArray alloc] init];
    
    [russiskTale addObject:@"RusKlem"];
    [russiskTale addObject:@"RusSmerte"];
    [russiskTale addObject:@"RusSproyte"];

    [rumenskTale addObject:@"RumKlem"];
    [rumenskTale addObject:@"RumSmerte"];
    [rumenskTale addObject:@"RumSproyte"];

    [arabiskTale addObject:@"AraKlem"];
    [arabiskTale addObject:@"AraSmerte"];
    [arabiskTale addObject:@"AraSproyte"];
    
    return self;
}

// action from pressing putton with sound symbol
- (IBAction)snakk0:(id)sender{
   NSLog(@"snakk0"); 
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:oversattSetningTaleURL0 error:nil];
    [player play];
}

// these are not implemented in demonstrator
- (IBAction)snakk1:(id)sender{
    NSLog(@"snakk1");
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:oversattSetningTaleURL1 error:nil];
    [player play];
}
- (IBAction)snakk2:(id)sender{
    NSLog(@"snakk2");
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:oversattSetningTaleURL2 error:nil];
    [player play];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad");

    [norskSetning0 setText:nil];
    [norskSetning1 setText:nil];
    [norskSetning2 setText:nil];
    [oversattSetning0 setText:nil];
    [oversattSetning1 setText:nil];
    [oversattSetning2 setText:nil];

    // languages not implemented in demonstrator
    [languageAlbansk    setEnabled:NO];
    [languageAmharisk   setEnabled:NO];
    [languageFarsi      setEnabled:NO];
    [languageKinesisk   setEnabled:NO];
    [languageSamisk     setEnabled:NO];
    [languageSomali     setEnabled:NO];
    [languageThai       setEnabled:NO];
    [languageTyrkisk    setEnabled:NO];
    [languageUrdu       setEnabled:NO];

    // initialise with russian - as if you just pressed "Russian" button. Then the russian button is now disableled, since
    // pushing it again now is meaningless - Rumensk and Arabisk are now enabeled, and if pushed the text and sound will update.
    // see also function update below
    [languageRussisk    setEnabled:NO];
    [languageRumensk    setEnabled:YES];
    [languageArabisk    setEnabled:YES];  
    
    // only these are implemented in deomstrator
    // to make the current languate visible it has red color in disabeled state
    [languageRussisk    setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];    
    [languageRumensk    setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];    
    [languageArabisk    setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];

    // only these are implemented
    // to make the current sentence visible it has red color in disabeled state
    [buttonBalashandtering   setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];    
    [buttonTiltak            setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];    
    [buttonSykdomshistorie   setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];

    // initialise with basalhantering
    [buttonBalashandtering      setEnabled:NO];
    [buttonTiltak               setEnabled:YES];
    [buttonSykdomshistorie      setEnabled:YES];
    // the other categories are not implemented in demonstrator
    [buttonVitalfunksjoner      setEnabled:NO];
    [buttonSymptomogdiagnose    setEnabled:NO];
    [buttonAdiministrativedata  setEnabled:NO];
    
    currentLanguageWritten = russiskSkrift;
    currentLanguageSpoken  = russiskTale;
    currentSentence = 0; 
    
    [self update];
}

- (void)update{
    [norskSetning0    setText:[norskSkrift            objectAtIndex:currentSentence]];
    [oversattSetning0 setText:[currentLanguageWritten objectAtIndex:currentSentence]];
    NSString           *url = [currentLanguageSpoken  objectAtIndex:currentSentence];
    oversattSetningTaleURL0 = [[NSURL alloc] initFileURLWithPath:
                              [[NSBundle mainBundle] pathForResource:url ofType:@"m4a"]];
}

// actions from pressing puttons
- (IBAction)buttonBalashandteringPressed:(id)sender{
    NSLog(@"buttonBalashandteringPressed");
    [buttonBalashandtering      setEnabled:NO];
    [buttonTiltak               setEnabled:YES];
    [buttonSykdomshistorie      setEnabled:YES];    
    currentSentence = 0;
    [self update];
}

- (IBAction)buttonTiltakPressed         :(id)sender{
    NSLog(@"buttonTiltakPressed");
    [buttonBalashandtering      setEnabled:YES];
    [buttonTiltak               setEnabled:NO];
    [buttonSykdomshistorie      setEnabled:YES];
    currentSentence = 2;
    [self update];
}

- (IBAction)buttonSykdomshistoriePressed:(id)sender{
    NSLog(@"buttonSykdomshistoriePressed");
    [buttonBalashandtering      setEnabled:YES];
    [buttonTiltak               setEnabled:YES];
    [buttonSykdomshistorie      setEnabled:NO];    
    currentSentence = 1;
    [self update];
}

- (IBAction)languageRussiskPressed:(id)sender{
    NSLog(@"languageRussiskPressed");
    [languageRussisk setEnabled:NO];
    [languageRumensk setEnabled:YES];
    [languageArabisk setEnabled:YES];   
    currentLanguageWritten = russiskSkrift;
    currentLanguageSpoken  = russiskTale;
    [self update];
}

- (IBAction)languageRumenskPressed:(id)sender{
    NSLog(@"languageRumenskPressed");
    [languageRussisk setEnabled:YES];
    [languageRumensk setEnabled:NO];
    [languageArabisk setEnabled:YES];
    currentLanguageWritten = rumenskSkrift;
    currentLanguageSpoken  = rumenskTale;
    [self update];
}

- (IBAction)languageArabiskPressed:(id)sender{
    NSLog(@"languageArabiskPressed");
    [languageRussisk setEnabled:YES];
    [languageRumensk setEnabled:YES];
    [languageArabisk setEnabled:NO];
    currentLanguageWritten = arabiskSkrift;
    currentLanguageSpoken  = arabiskTale;
    [self update];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return YES;
//}

@end
