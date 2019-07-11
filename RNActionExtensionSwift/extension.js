import {
  AppRegistry,
  SafeAreaView,
  View,
  Text,
} from 'react-native';
import React from 'react';
import {name as appName} from './app.json';

 const Share = () => {
  return (
    <SafeAreaView style={{flex: 1}}>
      <View style={{flex: 1, alignItems: 'center', justifyContent: 'center'}}>
        <Text>Action Extension</Text>
      </View>
    </SafeAreaView>
  )
}

 AppRegistry.registerComponent(appName, () => Share);
