import {
  AppRegistry,
  NativeModules,
  SafeAreaView,
  View,
  Text,
  TouchableOpacity,
} from 'react-native';
import React, {useState, useEffect} from 'react';
import {name as appName} from './app.json';


const Share = () => {
  const {done, getData} = NativeModules.ActionExtension;
  const [data, updateData] = useState();
  useEffect(() => {
    const getDataFromExtension = async () => {
      try {
        const extensionData = await getData();
        updateData(extensionData);
      } catch (error) {
        console.log(error);
      }
    }
    getDataFromExtension();
  }, []);

  return (
    <SafeAreaView style={{flex: 1}}>
      <View style={{flex: 1, alignItems: 'center', justifyContent: 'center'}}>
        <Text>Action Extension</Text>
        {data && (
          <View>
            <Text>{data.type}</Text>
            <Text>{data.value}</Text>
          </View>
          )
        }
        <TouchableOpacity onPress={() => {
          done();
        }}>
          <Text style={{color: 'blue'}}>Close</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  )
}

AppRegistry.registerComponent(appName, () => Share);
