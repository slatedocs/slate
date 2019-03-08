# Mobile OCR Scanner

With our Mobile OCR Scanner SDK you can use your native camera to scan the MRZ code of a identity document or passport. It will extract all relevant data like firstname, lastname, ID or passport number, nationality, date of birth, expiration date and personal number. Documents type TD1, TD2 and TD3 are supported. All processing is performed completely offline on your device. No any data leaving your device.

**IMPORTANT**: *SCANNING IDENTITY DOCUMENTS IS IN MOST CASES RESTRICTED BY LAW. OBSERVE THE APPLICABLE LAWS USING THIS SDK.*

This scanner optimize OCR results by first performing of preprocessing filters for the captured image and use of regular expressions to handle data and type of document.
## How to try demo app

Your can easily try our OCR Scanner through the test app named "Chekin ID". Currently only available for iOS devices, in Apple Store.

[*Link to app*]
## How to add ScannerChekin to your project

**Adding iOS SDK - ScannerChekinIOS**

'ScannerChekinIOS' is now available through the dependency manager CocoaPods. At this moment this can be installed by executing:

`[sudo] gem install cocoapods`

If you have installed Cocoapods you can just add 'ScannerChekinIOS' to your workspace by making sure the following lines are in your Podfile:

`source 'https://github.com/CocoaPods/Specs.git`<br>
`platform :ios, '12.0'`<br>
`use_frameworks!`<br>
`pod "ScannerChekinIOS"`<br>

This tells CocoaPods that you want to include the 'ScannerChekinIOS' SDK as a dependency for your project. Finally, save and close Podfile, then in Terminal, within the same directory to which you navigated earlier, type the following:

`pod install`

Add an import at the top of your swift file like this:

`import ScannerChekinIOS`

In the controller where you launch the scanner you will need to add the following from the class PassportScannerController included in 'ScannerChekinIOS':

> These are the required methods and variables we need to put in your code:

```swift


    protocol ProcessMRZ {
       func processMRZ(mrz:MRZParser)
    }

    class MyScannerViewController: PassportScannerController {

       var delegate: ProcessMRZ? /// Delegate set by the calling controller so that we can pass on ProcessMRZ events.


        override func viewDidLoad() {
            super.viewDidLoad();

            self.debug = true // So that we can see what is going on (scan text and quality indicator)
            self.accuracy = 1  // 1 = All checksums should pass (is the default so we could skip this line)
            self.mrzType = .auto // Check TD1, TD2 and TD3  
        }


        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            self.StartScan(sender: self) //Launch scanner in this view controller
        }


        override func successfulScan(mrz: MRZParser) {
            print("Results: {\(mrz.description)\n}")
            delegate?.processMRZ(mrz: mrz) //When scanner is successful, get results.
        }  

        /**
        protocol function for ProcessMRZ for receiving the scanned MRZ
        :param: mrz The scanned MRZ
        */
        func processMRZ(mrz:MRZParser) {
            let results = mrz.description //All data captured from MRZ code.
        }
    }
```


### Tessdata

This SDK use Tesseract and currently requires the tessdata folder with the trained language file (.traineddata) to work and you need to add it in your project. If Tesseract can't find a language file in your own project, it's probably because you created the tessdata folder as a symbolic group instead of a referenced folder. If the tessdata folder has a blue icon in XCode, it is indicating it was imported as a referenced folder instead of a symbolic group. You can download our trained tessdata here: [Tessdata folder](https://drive.google.com/file/d/16JpWsAaC11GstXEsJCgSpWPnqWGpvc1l/view)
