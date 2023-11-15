import Foundation
import AVFoundation

@objc(VideoCompressor)
class VideoCompressor: NSObject {

    @objc
    func compressVideo(_ inputURL: URL, withResolver resolve:@escaping RCTPromiseResolveBlock, withRejecter reject:@escaping RCTPromiseRejectBlock) -> Void  {
        print("File size before compression: \(self.getFileSizeInMB(inputURL)) mb")
        // This line creates a generic filename based on UUID, but you may want to use your own
        // The extension must match with the AVFileType enum
        let path = NSTemporaryDirectory() + UUID().uuidString + ".m4v"
        let outputURL = URL.init(fileURLWithPath: path)
        let urlAsset = AVURLAsset(url: inputURL)
        // You can change the presetName value to obtain different results
        if let exportSession = AVAssetExportSession(asset: urlAsset,
                                                    presetName:AVAssetExportPresetMediumQuality) {
            exportSession.outputURL = outputURL
            // Changing the AVFileType enum gives you different options with
            // varying size and quality. Just ensure that the file extension
            // aligns with your choice
            exportSession.outputFileType = AVFileType.mov
            
            exportSession.exportAsynchronously {
                switch exportSession.status {
                case .completed:
                    print("File size after compression: \(self.getFileSizeInMB(outputURL)) mb")
                    resolve(outputURL.absoluteString)
                    break
                case .failed:
                    print("FAILED")
                    reject("event_failure", "compression failed", nil);
                    break
                default:
                    print("something went wrong")
                    break
                }

            }
        }
    }
    
    // This code just exists for getting the before size. You can remove it from production code
    func getFileSizeInMB(_ inputURL: URL) -> Double? {
        do {
            let data = try Data(contentsOf: inputURL)
            let sizeInMB = Double(data.count) / 1024.0 / 1024.0
            
            return sizeInMB
        } catch {
            print("Error: \(error)")
            return nil
        }
    }

}

