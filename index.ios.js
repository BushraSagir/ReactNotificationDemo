/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import { AppRegistry } from 'react-native';
import { NativeModules 
} from 'react-native';

module.exports = NativeModules.DemoNotificationProject
import DemoNotificationProject from './App';

AppRegistry.registerComponent('DemoNotificationProject', () => DemoNotificationProject);
