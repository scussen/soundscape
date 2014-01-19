soundscape
==========

The Sound Scape demo application builds on the SynthMixDemo application [in the repo...](https://github.com/scussen/synthmixerdemo)

Sound Scape displays a ‘keyboard’ of 40 notes [keyboard display](scratchFullSet.png) these keys are mapped via a noteMap in the SCSoundScapeViewController’s viewDidLoad method.   In this example the mapping is to Midi Notes in the Key of G (see SCNoteDef.m).  You can see that the code has been built so that it can be easily extended to provide multiple note maps. 

For simplicity, the Sound Scape been built using one instrument (the fiddle) loaded thought the SCAudioController (as used in SynthMixDemo).  We are not using any effects unit pitch adjustment and we don’t need the multichannel mixer for this version (though they are still in there).

Features:

- One instrument loaded from a sound font

- 40 note keyboard with a mapping of Midi notes in the Key of G from G in Octave 3 to F# in Octave 7.

- Multiple keyboard notes can be played at once
 
Licence info:

- The GeneralUser GS sound font is from [S. Christian Collins](http://www.schristiancollins.com/generaluser.php) where you will find his current licence


Presentation:

- My slide deck for the Dec 6th, 2013 'Intro To iOS Core Audio' presentation for the Cocoa Conspiracy is here on [Slide Share](http://www.slideshare.net/slideshow/embed_code/29184534)

