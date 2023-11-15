import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-video-compressor' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

// @ts-expect-error
const isTurboModuleEnabled = global.__turboModuleProxy != null;

const VideoCompressorModule = isTurboModuleEnabled
  ? require('./NativeVideoCompressor').default
  : NativeModules.VideoCompressor;

const VideoCompressor = VideoCompressorModule
  ? VideoCompressorModule
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function compressVideo(inputURL: string): Promise<string> {
  if (Platform.OS === 'ios') {
    return VideoCompressor.compressVideo(inputURL);
  } else {
    return Promise.reject("It's not supported on your platform");
  }
}
