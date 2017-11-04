import {
  AppRegistry
} from 'react-native';

import { NativeModules } from 'react-native';

export const sendNotification = (callback) => {
  NativeModules.NotificationDemo.sendNotification
}
