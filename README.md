# react-native-video-compressor

# IOS ONLY

## Installation

```sh
npm install react-native-video-compressor
```

## Usage

'react-native-image-picker' was used for picking video from phone gallery

```js
import { compressVideo } from 'react-native-video-compressor';
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
