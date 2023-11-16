# react-native-video-compressor

# Description

# IOS ONLY

Turbo Module package for compressing video file by providing url of the file
Requires New Architecture

## Installation

```sh
npm install rn-video-compressor
```

```sh
yarn add rn-video-compressor
```

## Usage

'react-native-image-picker' was used for picking video from phone gallery

```js
import { compressVideo } from 'rn-video-compressor';
import { launchImageLibrary } from 'react-native-image-picker';
// ...

const video = await launchImageLibrary({ mediaType: 'video' });
if (video.assets?.[0]?.uri) {
  const outputURL = await compressVideo(video.assets[0].uri);
  console.log('url of the compressed video:', outputURL);
}
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
