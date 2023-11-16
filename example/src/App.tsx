import React from 'react';

import { StyleSheet, View, Button } from 'react-native';
import { compressVideo } from 'rn-video-compressor';
import { launchImageLibrary } from 'react-native-image-picker';

export default function App() {
  const selectVideo = async () => {
    try {
      const video = await launchImageLibrary({ mediaType: 'video' });
      if (video.assets?.[0]?.uri) {
        const outputURL = await compressVideo(video.assets[0].uri);
        console.log('url of the compressed video:', outputURL);
      }
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <View style={styles.container}>
      <Button title="Select Video" onPress={selectVideo} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
