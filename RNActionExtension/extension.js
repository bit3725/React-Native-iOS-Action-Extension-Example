import {
  AppRegistry,
  NativeModules,
  SafeAreaView,
  View,
  Text,
  TouchableOpacity,
} from 'react-native';
import React from 'react';
import {name as appName} from './app.json';

const Share = () => {
  return (
    <SafeAreaView style={{flex: 1}}>
      <View style={{flex: 1, alignItems: 'center', justifyContent: 'center'}}>
        <Text>Action Extension</Text>
        <TouchableOpacity onPress={() => {
          NativeModules.ActionExtension.done();
        }}>
          <Text style={{color: 'blue'}}>Close</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  )
}

AppRegistry.registerComponent(appName, () => Share);
