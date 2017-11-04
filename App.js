/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Alert,
  Button,
  NativeModules,
  NotificationDemo 
} from 'react-native';
//import { sendNotification } from './NotificationDemo'
import PushNotification from 'react-native-push-notification';



//var notification = require('react-native').NativeModules.NotificationDemo
export default class App extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to Demo Notification Project!
        </Text>
        <Text style={styles.instructions}>
          To get started, click on the button for demo notification 
        </Text>
        <Button
        onPress={this.onPressLearnMore}
        title="Show Notification"
        accessibilityLabel="Learn more about this purple button"
      />

    </View>
    );
  }

  onPressLearnMore() {
    Alert.alert('on Press Notification!');
    //notification.sendNotification
    PushNotification.localNotificationSchedule({ 
      message: "My Notification Message", // message 
      date: new Date(Date.now() + (60)) // your required time 
      }); 
       }


}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
