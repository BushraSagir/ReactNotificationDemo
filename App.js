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

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' +
    'Cmd+D or shake for dev menu',
  android: 'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

var notification = require('react-native').NativeModules.NotificationDemo
export default class App extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to Demo Notification Project!
        </Text>
        <Text style={styles.instructions}>
          To get started, click on the button for demo notification testtttttttt
        </Text>
        <Text style={styles.instructions}>
          {instructions}
        </Text>
        <Button
        onPress={this.onPressLearnMore}
        title="Learn More"
        accessibilityLabel="Learn more about this purple button"
      />

    </View>
    );
  }

  onPressLearnMore() {
    Alert.alert('on Press Notification!');
    notification.sendNotification
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